/// <reference types="@capacitor/cli" />

import type {
  SetContactOptions
} from './interfaces/base';
import type { PluginListenerHandle } from '@capacitor/core';

import type { PushMessageEvent } from './interfaces/push';

export interface EmarsysSDKCustomPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  
  addListener(
    eventName: 'pushMessageEvent',
    listenerFunc: (event: PushMessageEvent) => void
  ): Promise<PluginListenerHandle> & PluginListenerHandle;

  getUUID(value: string): Promise<{ value: string }>;

  setContact(options: SetContactOptions): Promise<void>;
  

}
