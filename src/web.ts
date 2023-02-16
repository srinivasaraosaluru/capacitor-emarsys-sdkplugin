import { WebPlugin } from '@capacitor/core';

// import type { EmarsysSDKCustomPlugin } from './definitions';

export class EmarsysSDKCustomWeb extends WebPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
  async getUUID(value: string): Promise<{ value: string }> {
    console.log('ECHO', value);
    return {value:value};
  }
}
