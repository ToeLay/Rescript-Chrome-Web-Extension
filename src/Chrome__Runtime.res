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

/*** Hello */
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
  icognito?: bool,
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

/** An object which allows two way communication with other pages. */
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
external lastError: error = "lastError"
external getLastError: t => error = "lastError"

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

module OnConnect = {
  @val external addListener: (Port.t => unit) => unit = "chrome.runtime.onConnect.addListener"
}
