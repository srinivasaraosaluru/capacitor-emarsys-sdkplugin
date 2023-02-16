# capacitor-emarsys-sdk-plugin

Custom Capacitor Plugin To have communication with Emarsys SDK

## Install

```bash
npm install capacitor-emarsys-sdk-plugin
npx cap sync
```

## API

<docgen-index>

* [`echo(...)`](#echo)
* [`addListener('pushMessageEvent', ...)`](#addlistenerpushmessageevent)
* [`getUUID(...)`](#getuuid)
* [`setContact(...)`](#setcontact)
* [Interfaces](#interfaces)

</docgen-index>

<docgen-api>
<!--Update the source file JSDoc comments and rerun docgen to update the docs below-->

### echo(...)

```typescript
echo(options: { value: string; }) => Promise<{ value: string; }>
```

| Param         | Type                            |
| ------------- | ------------------------------- |
| **`options`** | <code>{ value: string; }</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### addListener('pushMessageEvent', ...)

```typescript
addListener(eventName: 'pushMessageEvent', listenerFunc: (event: PushMessageEvent) => void) => Promise<PluginListenerHandle> & PluginListenerHandle
```

| Param              | Type                                                                              |
| ------------------ | --------------------------------------------------------------------------------- |
| **`eventName`**    | <code>'pushMessageEvent'</code>                                                   |
| **`listenerFunc`** | <code>(event: <a href="#pushmessageevent">PushMessageEvent</a>) =&gt; void</code> |

**Returns:** <code>Promise&lt;<a href="#pluginlistenerhandle">PluginListenerHandle</a>&gt; & <a href="#pluginlistenerhandle">PluginListenerHandle</a></code>

--------------------


### getUUID(...)

```typescript
getUUID(value: string) => Promise<{ value: string; }>
```

| Param       | Type                |
| ----------- | ------------------- |
| **`value`** | <code>string</code> |

**Returns:** <code>Promise&lt;{ value: string; }&gt;</code>

--------------------


### setContact(...)

```typescript
setContact(options: SetContactOptions) => Promise<void>
```

| Param         | Type                                                            |
| ------------- | --------------------------------------------------------------- |
| **`options`** | <code><a href="#setcontactoptions">SetContactOptions</a></code> |

--------------------


### Interfaces


#### PluginListenerHandle

| Prop         | Type                                      |
| ------------ | ----------------------------------------- |
| **`remove`** | <code>() =&gt; Promise&lt;void&gt;</code> |


#### PushMessageEvent

| Prop            | Type                                           | Since |
| --------------- | ---------------------------------------------- | ----- |
| **`eventName`** | <code>string</code>                            | 1.0.0 |
| **`data`**      | <code>{ key: string; value: string; }[]</code> | 1.0.0 |


#### SetContactOptions

| Prop                    | Type                | Since |
| ----------------------- | ------------------- | ----- |
| **`contactFieldValue`** | <code>string</code> | 1.0.0 |

</docgen-api>
