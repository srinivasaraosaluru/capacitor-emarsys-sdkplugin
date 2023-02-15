import Foundation
import Capacitor
import EmarsysSDK

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(EmarsysSDKCustomPlugin)
public class EmarsysSDKCustomPlugin: CAPPlugin, URLSessionDelegate {
    private let implementation = EmarsysSDKCustom()
    private var savedRegisterCall: CAPPluginCall? = nil;
    public var registered: Bool = false;
    private var messageStack = [StackedMessage]();
    
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": implementation.echo(value)
        ])
    }
    
    @objc func getUUID(_ call: CAPPluginCall) {
            let value = call.getString("value") ?? ""
            call.resolve([
                "value": UIDevice.current.identifierForVendor!.uuidString
            ])
    }
        
    override public func load() {
        print("It will load on Load of the Application")
        let config = EMSConfig.make { builder in
            builder.setMobileEngageApplicationCode("EMSD5-99166")
            builder.setMerchantId("1F634D68EE4C9C7A")
            builder.enableConsoleLogLevels([EMSLogLevel.info, EMSLogLevel.warn, EMSLogLevel.error, EMSLogLevel.basic])
        }
        Emarsys.setup(config: config)
        //        print(Emarsys.)
        print(config);
        print("Emarsys Setup Successded v1.3")
        
        UNUserNotificationCenter.current().delegate = Emarsys.push
        
        Emarsys.setContact(contactFieldId: NSNumber(value: 123), contactFieldValue: "TestSrini")
        //        Emarsys.push.setPushToken();
                NotificationCenter.default.addObserver(self, selector: #selector(self.didRegisterWithToken(notification:)), name: .emarsysRegisterWithToken, object: nil)
        //        //
        //
                let eventHandler = { eventName, payload in
                    self.sendMessage(eventName: eventName, payload: payload);
                };
        
                Emarsys.push.notificationEventHandler = eventHandler;
                Emarsys.push.silentMessageEventHandler = eventHandler;
                Emarsys.inApp.eventHandler = eventHandler;
                Emarsys.onEventAction.eventHandler = eventHandler;
        
//                        print(notificationInformation)
        
                Emarsys.push.silentMessageInformationBlock = {notificationInformation in
                    self.sendSilentMessageInformation(block: notificationInformation);
                }
    }
    
    
    
    private func sendSilentMessageInformation(block: EMSNotificationInformation) {
        let data: [String: Any] = ["campaignId": block.campaignId];
        self.send(eventName: "silentMessageInformation", data: data);
    }
    
    private func send(eventName: String, data: [String : Any]) {
        if(self.registered) {
            self.notifyListeners(eventName, data: data);
        } else {
            self.messageStack.append(StackedMessage(eventName: eventName, data: data));
        }
    }
    // Helper
    private func sendMessage(eventName: String, payload: [String: Any]?) {
        let data: [String: Any] = ["eventName": eventName, "data": payload ?? []];
        self.send(eventName: "event", data: data);
    }
    
    
    @objc func didRegisterWithToken(notification: NSNotification) {
        print("I reached till here")
        Emarsys.push.setPushToken(notification.object as! Data)
        if(self.savedRegisterCall != nil) {
            let deviceToken = (notification.object as! Data).reduce("", {$0 + String(format: "%02X", $1)})
            self.savedRegisterCall!.resolve(["token": deviceToken])
            self.savedRegisterCall = nil;
        }
        self.registered = true;
        self.sendStacked();
    }
    
    
    private func sendStacked() {
        if(self.messageStack.count > 0) {
            for message in self.messageStack {
                self.send(eventName: message.eventName, data: message.data);
            }
            self.messageStack.removeAll();        }
    }
}
