module OnConnect = {
  /** Fired when a connection is made from either an extension process or a content script (by runtime.connect). */
  @val
  external addListener: (RuntimeTypes.Port.t => unit) => unit =
    "chrome.runtime.onConnect.addListener"
}

module OnConnectExternal = {
  /** Fired when a connection is made from another extension (by runtime.connect), or from an externally connectable web site. */
  @val
  external addListener: (RuntimeTypes.Port.t => unit) => unit =
    "chrome.runtime.onConnectExternal.addListener"
}

module OnConnectNative = {
  /** Fired when a connection is made from a native application. 
   This event requires the "nativeMessaging" permission. 
   It is only supported on Chrome OS. 
   */
  @val
  external addListener: (RuntimeTypes.Port.t => unit) => unit =
    "chrome.runtime.onConnectNative.addListener"
}

module OnInstalled = {
  /** Fired when the extension is first installed, when the extension is updated to a new version, and when Chrome is updated to a new version. */
  @val
  external addListener: (RuntimeTypes.onInstalledDetails => unit) => unit =
    "chrome.runtime.onInstalled.addListener"
}

module OnMessage = {
  /** Fired when a message is sent from either an extension process (by runtime.sendMessage) or a content script (by tabs.sendMessage). */
  @val
  external addListener: (
    (JSON.t, RuntimeTypes.messageSender, unit => unit) => option<bool>
  ) => unit = "chrome.runtime.onMessage.addListener"
}

module OnMessageExternal = {
  /** Fired when a message is sent from another extension (by runtime.sendMessage). Cannot be used in a content script. */
  @val
  external addListener: (
    (JSON.t, RuntimeTypes.messageSender, unit => unit) => option<bool>
  ) => unit = "chrome.runtime.onMessageExternal.addListener"
}

module OnRestartRequired = {
  /** Fired when an app or the device that it runs on needs to be restarted. 
   The app should close all its windows at its earliest convenient time to let the restart to happen.
    If the app does nothing, a restart will be enforced after a 24-hour grace period has passed. 
    Currently, this event is only fired for Chrome OS kiosk apps. 
    */
  @val
  external addListener: (RuntimeTypes.onRestartRequiredReason => unit) => unit =
    "chrome.runtime.onRestartRequired.addListener"
}

module OnStartup = {
  /** Fired when a profile that has this extension installed first starts up. 
   This event is not fired when an incognito profile is started, even if this extension is operating in 'split' incognito mode.
 */
  @val
  external addListener: (unit => unit) => unit = "chrome.runtime.onStartup.addListener"
}

module OnSuspend = {
  /** Sent to the event page just before it is unloaded. 
   This gives the extension opportunity to do some clean up. 
   Note that since the page is unloading, any asynchronous operations started while handling this event are not guaranteed to complete. 
   If more activity for the event page occurs before it gets unloaded the onSuspendCanceled event will be sent and the page won't be unloaded. */
  @val
  external addListener: (unit => unit) => unit = "chrome.runtime.onSuspend.addListener"
}

module OnSuspendCanceled = {
  /** Sent after onSuspend to indicate that the app won't be unloaded after all. */
  @val
  external addListener: (unit => unit) => unit = "chrome.runtime.onSuspendCanceled.addListener"
}

module OnUpdateAvailable = {
  /** Fired when an update is available, but isn't installed immediately because the app is currently running. 
   If you do nothing, the update will be installed the next time the background page gets unloaded, if you want it to be installed sooner you can explicitly call chrome.runtime.reload(). 
   If your extension is using a persistent background page, the background page of course never gets unloaded, so unless you call chrome.runtime.reload() manually in response to this event the update will not get installed until the next time Chrome itself restarts. 
   If no handlers are listening for this event, and your extension has a persistent background page, it behaves as if chrome.runtime.reload() is called in response to this event. */
  @val
  external addListener: (RuntimeTypes.updateDetails => unit) => unit =
    "chrome.runtime.onUpdateAvailable.addListener"
}

module OnUserScriptConnect = {
  /** Fired when a connection is made from a user script from this extension. */
  @val
  external addListener: (RuntimeTypes.Port.t => unit) => unit =
    "chrome.runtime.onUserScriptConnect.addListener"
}

module OnUserScriptMessage = {
  /** Fired when a message is sent from a user script associated with the same extension. */
  @val
  external addListener: (
    (JSON.t, RuntimeTypes.messageSender, unit => unit) => option<bool>
  ) => unit = "chrome.runtime.onUserScriptMessage.addListener"
}
