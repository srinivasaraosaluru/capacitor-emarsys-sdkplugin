/// <reference types="@capacitor/cli" />

import type {
  SetContactOptions
} from './interfaces/base';
import type { PluginListenerHandle } from '@capacitor/core';

import type { PushMessageEvent, TokenResult } from './interfaces/push';

export interface EmarsysSDKCustomPlugin {
  
  echo(options: { value: string }): Promise<{ value: string }>;
  
  addListener(
    eventName: 'pushMessageEvent',
    listenerFunc: (event: PushMessageEvent) => void
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  getUUID(value: string): Promise<{ value: string }>;

  
  requestPermissions(): Promise<PermissionStatus>;

  checkPermissions(): Promise<PermissionStatus>;

  setContact(options: SetContactOptions): Promise<void>;

  getPushToken(): Promise<TokenResult>;

  register(): Promise<TokenResult>;

  checkPermissions(): Promise<PermissionStatus>;

  clearContact(options: SetContactOptions): Promise<void>;



  

}
