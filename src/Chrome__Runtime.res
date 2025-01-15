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

// Event Modules
module OnConnect = RuntimeEvents.OnConnect

module OnConnectExternal = RuntimeEvents.OnConnectExternal

module OnConnectNative = RuntimeEvents.OnConnectNative

module OnInstalled = RuntimeEvents.OnInstalled

module OnMessage = RuntimeEvents.OnMessage

module OnMessageExternal = RuntimeEvents.OnMessageExternal

module OnRestartRequired = RuntimeEvents.OnRestartRequired

module OnStartup = RuntimeEvents.OnStartup

module OnSuspend = RuntimeEvents.OnSuspend

module OnSuspendCanceled = RuntimeEvents.OnSuspendCanceled

module OnUpdateAvailable = RuntimeEvents.OnUpdateAvailable

module OnUserScriptConnect = RuntimeEvents.OnUserScriptConnect

module OnUserScriptMessage = RuntimeEvents.OnUserScriptMessage
