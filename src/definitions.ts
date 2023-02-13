export interface EmarsysSDKCustomPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
