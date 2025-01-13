type t

type contextType =
  | /** Specifies the context type as a tab */
  @as("TAB")
  Tab
  | /** Specifies the context type as an extension popup window */
  @as("POPUP")
  Popup
  | /** Specifies the context type as a service worker. */
  @as("BACKGROUND")
  Background
  | /** Specifies the context type as an offscreen document. */
  @as("OFFSCREEN_DOCUMENT")
  OffScreenDocument
  | /** Specifies the context type as a side panel. */
  @as("SIDE_PANEL")
  SidePanel
  | /** Specifies the context type as developer tools. */
  @as("DEVELOPER_TOOLS")
  DeveloperTools

/** 
 A filter to match against certain extension contexts. 
 Matching contexts must match all specified filters; any filter that is not specified matches all available contexts. 
 Thus, a filter of `{}` will match all available contexts. 
 */
type contextFilter = {
  contextIds?: array<string>,
  contextTypes?: array<contextType>,
  documentIds?: array<string>,
  documentOrigins?: array<string>,
  documentUrls?: array<string>,
  frameIds?: array<int>,
  incognito?: bool,
  tabIds?: array<int>,
  windowIds?: array<int>,
}

/** A context hosting extension content. */
type extensionContext = {
  /** A unique identifier for this context */
  contextId: string,
  /** The type of context this corresponds to. */
  contextType: contextType,
  /** A UUID for the document associated with this context, or undefined if this context is hosted not in a document. */
  documentId?: string,
  /** The origin of the document associated with this context, or undefined if the context is not hosted in a document. */
  documentOrigin?: string,
  /** The URL of the document associated with this context, or undefined if the context is not hosted in a document. */
  documentUrl?: string,
  /** The ID of the frame for this context, or -1 if this context is not hosted in a frame. */
  frameId: int,
  /** Whether the context is associated with an incognito profile. */
  incognito: bool,
  /** The ID of the tab for this context, or -1 if this context is not hosted in a tab. */
  tabId: int,
  /** The ID of the window for this context, or -1 if this context is not hosted in a window. */
  windowId: int,
}

/** An object containing information about the script context that sent a message or request. */
type messageSender = {
  /** A UUID of the document that opened the connection. */
  documentId?: string,
  /** The lifecycle the document that opened the connection is in at the time the port was created. 
   Note that the lifecycle state of the document may have changed since port creation. 
   */
  documentLifeCycle?: string,
  /** The frame that opened the connection. 0 for top-level frames, positive for child frames. This will only be set when tab is set. */
  frameId?: int,
  /** The ID of the extension that opened the connection, if any. */
  id?: int,
  /** The name of the native application that opened the connection, if any. */
  nativeApplication?: string,
  /** The origin of the page or frame that opened the connection. 
   It can vary from the url property (e.g., about:blank) or can be opaque (e.g., sandboxed iframes). 
   This is useful for identifying if the origin can be trusted if we can't immediately tell from the URL. 
   */
  origin?: string,
  /** The tabs.Tab which opened the connection, if any. 
   This property will only be present when the connection was opened from a tab (including content scripts), and only if the receiver is an extension, not an app. 
   */
  tab?: Chrome__Tabs.tab,
  /** The TLS channel ID of the page or frame that opened the connection, if requested by the extension, and if available. */
  tlsChannelId?: string,
  /** The URL of the page or frame that opened the connection. 
     If the sender is in an iframe, it will be iframe's URL not the URL of the page which hosts it. 
     */
  url?: string,
}

/** The reason that this event is being dispatched. */
type onInstallReason =
  | /** Specifies the event reason as an installation. */
  @as("install")
  Install
  | /** Specifies the event reason as an extension update. */
  @as("update")
  Update
  | /** Specifies the event reason as a Chrome update. */
  @as("chrome_update")
  ChromeUpdate
  | /** Specifies the event reason as an update to a shared module. */
  @as("shared_module_update")
  SharedModuleUpdate

/** The reason that the event is being dispatched. 
 'app_update' is used when the restart is needed because the application is updated to a newer version. 
 'os_update' is used when the restart is needed because the browser/OS is updated to a newer version. 
 'periodic' is used when the system runs for more than the permitted uptime set in the enterprise policy. 
 */
type onRestartRequiredReason =
  | /** Specifies the event reason as an application update. */
  @as("app_update")
  AppUpdate
  | /** Specifies the event reason as an update to the operating system. */
  @as("os_update")
  OsUpdate
  | /** Specifies the event reason as a periodic restart of the app. */
  @as("periodic")
  Periodic

/** The machine's processor architecture. */
type platformArch =
  | /** Specifies the platform architecture as arm. */
  @as("arm")
  Arm
  | /** Specifies the platform architecture as arm64. */
  @as("arm64")
  Arm64
  | /** Specifies the platform architecture as x86-32. */
  @as("x86-32")
  X86_32
  | /** Specifies the platform architecture as x86-64. */
  @as("x86-64")
  X86_64
  | /** Specifies the processer architecture as mips. */
  @as("mips")
  Mips
  | /** Specifies the processer architecture as mips64. */
  @as("mips64")
  Mips64

/** The native client architecture. This may be different from arch on some platforms. */
type platformNaclArch =
  | /** Specifies the platform architecture as arm. */
  @as("arm")
  Arm
  | /** Specifies the platform architecture as arm64. */
  @as("arm64")
  Arm64
  | /** Specifies the platform architecture as x86-32. */
  @as("x86-32")
  X86_32
  | /** Specifies the platform architecture as x86-64. */
  @as("x86-64")
  X86_64

/** The operating system Chrome is running on. */
type platformOs =
  | /** Specifies the MacOS operating system. */
  @as("mac")
  Mac
  | /** Specifies the Windows operating system. */
  @as("win")
  Win
  | /** Specifies the Android operating system. */
  @as("android")
  Android
  | /** Specifies the Chrome operating system. */
  @as("cros")
  Chrome
  | /** Specifies the Linux operating system. */
  @as("linux")
  Linux
  | /** Specifies the OpenBSD operating system. */
  @as("openbsd")
  OpenBSD
  | /** Specifies the Fuchsia operating system. */
  @as("fuchsia")
  Fuchsia

/** An object containing information about the current platform. */
type platformInfo = {
  /** The machine's processor architecture. */
  arch: platformArch,
  /** The native client architecture. This may be different from arch on some platforms. */
  naclArch: platformNaclArch,
  /** The operating system Chrome is running on. */
  os: platformOs,
}

/** Result of the update check. */
type requestUpdateCheckStatus =
  | /** Specifies that the status check has been throttled. This can occur after repeated checks within a short amount of time. */
  @as("throttled")
  Throttled
  | /** Specifies that there are no available updates to install. */
  @as("no_update")
  NoUpdate
  | /** Specifies that there is an available update to install. */
  @as("update_available")
  UpdateAvailable

module Port = {
  type t

  @get external getName: t => string = "name"
  @get external getSender: t => messageSender = "sender"

  @send external disconnect: t => unit = "disconnect"

  @send external postMessage: (t, JSON.t) => unit = "postMessage"

  module OnDisconnect = {
    @send @scope("onDisconnect") external addListener: (t => unit) => unit = "addListener"
  }

  module OnMessage = {
    @send @scope("onMessage") external addListener: (t, (JSON.t, t) => unit) => unit = "addListener"
  }
}

/** An object which allows two way communication with other pages. */
type error = {
  /** Details about the error which occurred. */
  message: string,
}

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
external lastError: option<error> = "lastError"

type connectInfo = {
  /** Whether the TLS channel ID will be passed into onConnectExternal for processes that are listening for the connection event. */
  includeTlsChannelId?: bool,
  /** Will be passed into onConnect for processes that are listening for the connection event. */
  name?: string,
}

/** Attempts to connect listeners within an extension (such as the background page), or other extensions/apps. This is useful for content scripts connecting to their extension processes, inter-app/extension communication, and web messaging. Note that this does not connect to any listeners in a content script. Extensions may connect to content scripts embedded in tabs via tabs.connect. */
@val
external connect: (~extensionId: string=?, ~connectInfo: connectInfo=?) => Port.t =
  "chrome.runtime.connect"

/** Connects to a native application in the host machine. This method requires the "nativeMessaging" permission.  */
@val
external connectNative: string => Port.t = "chrome.runtime.connectNative"

/** Fetches information about active contexts associated with this extension. */
@val
external getContexts: contextFilter => promise<array<extensionContext>> =
  "chrome.runtime.getContexts"

/** Fetches information about active contexts associated with this extension. */
@val
external getContextsWithCallback: (contextFilter, array<extensionContext> => unit) => unit =
  "chrome.runtime.getContexts"

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
external getPlatformInfo: unit => promise<platformInfo> = "chrome.runtime.getPlatformInfo"

/** Returns information about the current platform. */
@val
external getPlatformInfoWithCallback: (platformInfo => unit) => unit =
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

/** Holds the status of the update check and any details of the result if there is an update available */
type requestUpdateCheckResult = {
  status: requestUpdateCheckStatus,
  veersion?: string,
}
/** Requests an immediate update check be done for this app/extension. */
@val
external requestUpdateCheck: unit => promise<requestUpdateCheckResult> =
  "chrome.runtime.requestUpdateCheck"

/** Requests an immediate update check be done for this app/extension. */
@val
external requestUpdateCheckWithCallback: ((requestUpdateCheckStatus, string) => unit) => unit =
  "chrome.runtime.requestUpdateCheck"

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

type sendMessageOptions = {includeTlsChannelId?: bool}

/** Sends a single message to event listeners within your extension or a different extension/app. */
@val
external sendMessage: (
  ~extensionId: string=?,
  ~message: JSON.t,
  ~options: sendMessageOptions=?,
) => promise<JSON.t> = "chrome.runtime.sendMessage"

/** Sends a single message to event listeners within your extension or a different extension/app. */
@val
external sendMessageWithCallback: (
  ~extensionId: string=?,
  ~message: JSON.t,
  ~options: sendMessageOptions=?,
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

type onInstalledDetails = {
  /** The ID of the imported shared module extension which updated. This is present only if the reason is 'shared_module_update'. */
  id?: string,
  /** The previous version of the extension before the update. */
  previousVersion?: string,
  /** The reason that this event is being dispatched. */
  reason: onInstallReason,
}

module OnInstalled = {
  /** Fired when the extension is first installed, when the extension is updated to a new version, and when Chrome is updated to a new version. */
  @val
  external addListener: (onInstalledDetails => unit) => unit =
    "chrome.runtime.onInstalled.addListener"
}

module OnMessage = {
  /** Fired when a message is sent from either an extension process (by runtime.sendMessage) or a content script (by tabs.sendMessage). */
  @val
  external addListener: ((JSON.t, messageSender, unit => unit) => option<bool>) => unit =
    "chrome.runtime.onMessage.addListener"
}

module OnMessageExternal = {
  /** Fired when a message is sent from another extension (by runtime.sendMessage). Cannot be used in a content script. */
  @val
  external addListener: ((JSON.t, messageSender, unit => unit) => option<bool>) => unit =
    "chrome.runtime.onMessageExternal.addListener"
}

module OnRestartRequired = {
  /** Fired when an app or the device that it runs on needs to be restarted. 
   The app should close all its windows at its earliest convenient time to let the restart to happen.
    If the app does nothing, a restart will be enforced after a 24-hour grace period has passed. 
    Currently, this event is only fired for Chrome OS kiosk apps. 
    */
  @val
  external addListener: (onRestartRequiredReason => unit) => unit =
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

type updateDetails = {version: string}

module OnUpdateAvailable = {
  /** Fired when an update is available, but isn't installed immediately because the app is currently running. 
   If you do nothing, the update will be installed the next time the background page gets unloaded, if you want it to be installed sooner you can explicitly call chrome.runtime.reload(). 
   If your extension is using a persistent background page, the background page of course never gets unloaded, so unless you call chrome.runtime.reload() manually in response to this event the update will not get installed until the next time Chrome itself restarts. 
   If no handlers are listening for this event, and your extension has a persistent background page, it behaves as if chrome.runtime.reload() is called in response to this event. */
  @val
  external addListener: (updateDetails => unit) => unit =
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
  external addListener: ((JSON.t, messageSender, unit => unit) => option<bool>) => unit =
    "chrome.runtime.onUserScriptMessage.addListener"
}
