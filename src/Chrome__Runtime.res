type t

module Port = RuntimeTypes.Port

/** The ID of the extension/app. */
@val
@scope(("chrome", "runtime"))
external id: string = "id"
/** Populated with an error message if calling an API function fails; otherwise undefined. 
 This is only defined within the scope of that function's callback. 
 If an error is produced, but runtime.lastError is not accessed within the callback, a message is logged to the console listing the API function that produced the error. 
 API functions that return promises do not set this property. 
 */
@val
@scope(("chrome", "runtime"))
external lastError: option<RuntimeTypes.error> = "lastError"

/** Attempts to connect listeners within an extension (such as the background page), or other extensions/apps. 
 This is useful for content scripts connecting to their extension processes, inter-app/extension communication, and web messaging. 
 Note that this does not connect to any listeners in a content script. 
 Extensions may connect to content scripts embedded in tabs via tabs.connect. 
 */
@val
external connect: (~extensionId: string=?, ~connectInfo: RuntimeTypes.connectInfo=?) => Port.t =
  "chrome.runtime.connect"

/** Connects to a native application in the host machine. This method requires the "nativeMessaging" permission.  */
@val
external connectNative: string => Port.t = "chrome.runtime.connectNative"

/** Fetches information about active contexts associated with this extension. */
@val
external getContexts: RuntimeTypes.contextFilter => promise<array<RuntimeTypes.extensionContext>> =
  "chrome.runtime.getContexts"

/** Fetches information about active contexts associated with this extension. */
@val
external getContextsWithCallback: (
  RuntimeTypes.contextFilter,
  array<RuntimeTypes.extensionContext> => unit,
) => unit = "chrome.runtime.getContexts"

/** Returns details about the app or extension from the manifest. 
 The object returned is a serialization of the full manifest file. */
@val
external getManifest: unit => JSON.t = "chrome.runtime.getManifest"

/** Returns a DirectoryEntry for the package directory. */
@val
external // No information provided for DirectoryEntry type

getPackageDirectoryEntry: unit => promise<'directoryEntry> =
  "chrome.runtime.getPackageDirectoryEntry"

@val
external getPackageDirectoryEntryWithCallback: ('directoryEntry => unit) => unit =
  "chrome.runtime.getPackageDirectoryEntry"

/** Returns information about the current platform. */
@val
external getPlatformInfo: unit => promise<RuntimeTypes.platformInfo> =
  "chrome.runtime.getPlatformInfo"

/** Returns information about the current platform. */
@val
external getPlatformInfoWithCallback: (RuntimeTypes.platformInfo => unit) => unit =
  "chrome.runtime.getPlatformInfo"

/** Converts a relative path within an app/extension install directory to a fully-qualified URL. */
@val
external getURL: string => string = "chrome.runtime.getURL"

/** Open your Extension's options page, if possible. */
@val
external openOptionsPage: promise<unit> = "chrome.runtime.openOptionsPage"

/** Open your Extension's options page, if possible. */
@val
external openOptionsPageWithCallback: (unit => unit) => unit = "chrome.runtime.openOptionsPage"

/** Reloads the app or extension. 
 This method is not supported in kiosk mode. For kiosk mode, use chrome.runtime.restart() method.
 */
@val
external reload: unit => unit = "chrome.runtime.reload"

/** Requests an immediate update check be done for this app/extension. */
@val
external requestUpdateCheck: unit => promise<RuntimeTypes.requestUpdateCheckResult> =
  "chrome.runtime.requestUpdateCheck"

/** Requests an immediate update check be done for this app/extension. */
@val
external requestUpdateCheckWithCallback: (
  (RuntimeTypes.requestUpdateCheckStatus, string) => unit
) => unit = "chrome.runtime.requestUpdateCheck"

/** Restart the ChromeOS device when the app runs in kiosk mode. Otherwise, it's no-op. */
@val
external restart: unit => unit = "chrome.runtime.restart"

/** Restart the ChromeOS device when the app runs in kiosk mode after the given seconds. 
 If called again before the time ends, the reboot will be delayed. 
 If called with a value of -1, the reboot will be cancelled. 
 It's a no-op in non-kiosk mode. 
 It's only allowed to be called repeatedly by the first extension to invoke this API. 
 */
@val
external restartAfterDelay: int => promise<unit> = "chrome.runtime.restartAfterDelay"

/** Restart the ChromeOS device when the app runs in kiosk mode after the given seconds. 
 If called again before the time ends, the reboot will be delayed. 
 If called with a value of -1, the reboot will be cancelled. 
 It's a no-op in non-kiosk mode. 
 It's only allowed to be called repeatedly by the first extension to invoke this API. 
 */
@val
external restartAfterDelayWithCallback: (int, unit => unit) => unit =
  "chrome.runtime.restartAfterDelay"

/** Sends a single message to event listeners within your extension or a different extension/app. */
@val
external sendMessage: (
  ~extensionId: string=?,
  ~message: JSON.t,
  ~options: RuntimeTypes.sendMessageOptions=?,
) => promise<JSON.t> = "chrome.runtime.sendMessage"

/** Sends a single message to event listeners within your extension or a different extension/app. */
@val
external sendMessageWithCallback: (
  ~extensionId: string=?,
  ~message: JSON.t,
  ~options: RuntimeTypes.sendMessageOptions=?,
  JSON.t => unit,
) => unit = "chrome.runtime.sendMessage"

/** Send a single message to a native application. This method requires the "nativeMessaging" permission. */
@val
external sendNativeMessage: (string, JSON.t) => promise<JSON.t> = "chrome.runtime.sendNativeMessage"

/** Send a single message to a native application. This method requires the "nativeMessaging" permission. */
@val
external sendNativeMessageWithCallback: (string, JSON.t, JSON.t => unit) => unit =
  "chrome.runtime.sendNativeMessage"

/** Sets the URL to be visited upon uninstallation. 
 This may be used to clean up server-side data, do analytics, and implement surveys. 
 Maximum 1023 characters. 
 */
@val
external setUninstallURL: string => promise<unit> = "chrome.runtime.setUninstallURL"

/** Sets the URL to be visited upon uninstallation. 
 This may be used to clean up server-side data, do analytics, and implement surveys. 
 Maximum 1023 characters. 
 */
@val
external setUninstallURLWithCallback: (string, unit => unit) => unit =
  "chrome.runtime.setUninstallURL"

module OnConnect = {
  /** Fired when a connection is made from either an extension process or a content script (by runtime.connect). */
  @val
  external addListener: (Port.t => unit) => unit = "chrome.runtime.onConnect.addListener"
}

module OnConnectExternal = {
  /** Fired when a connection is made from another extension (by runtime.connect), or from an externally connectable web site. */
  @val
  external addListener: (Port.t => unit) => unit = "chrome.runtime.onConnectExternal.addListener"
}

module OnConnectNative = {
  /** Fired when a connection is made from a native application. 
   This event requires the "nativeMessaging" permission. 
   It is only supported on Chrome OS. 
   */
  @val
  external addListener: (Port.t => unit) => unit = "chrome.runtime.onConnectNative.addListener"
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
  external addListener: (Port.t => unit) => unit = "chrome.runtime.onUserScriptConnect.addListener"
}

module OnUserScriptMessage = {
  /** Fired when a message is sent from a user script associated with the same extension. */
  @val
  external addListener: (
    (JSON.t, RuntimeTypes.messageSender, unit => unit) => option<bool>
  ) => unit = "chrome.runtime.onUserScriptMessage.addListener"
}
