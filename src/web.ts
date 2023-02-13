import { WebPlugin } from '@capacitor/core';

import type { EmarsysSDKCustomPlugin } from './definitions';

export class EmarsysSDKCustomWeb extends WebPlugin implements EmarsysSDKCustomPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
