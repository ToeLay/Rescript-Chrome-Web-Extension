/** An event that caused a muted state change. */
type mutedInfoReason =
  | /** A user input action set the muted state. */
  @as("user")
  User
  | /** Tab capture was started, forcing a muted state change. */
  @as("capture")
  Capture
  | /** An extension, identified by the extensionId field, set the muted state. */
  @as("extension")
  Extension

/** The tab's muted state and the reason for the last state change. */
type mutedInfo = {
  /** The ID of the extension that changed the muted state. Not set if an extension was not the reason the muted state last changed. */
  extensionId?: string,
  /** Whether the tab is muted (prevented from playing sound). 
     The tab may be muted even if it has not played or is not currently playing sound. 
     Equivalent to whether the 'muted' audio indicator is showing. 
     */
  muted: bool,
  /** The reason the tab was muted or unmuted. 
     Not set if the tab's mute state has never been changed.
      */
  reason?: mutedInfoReason,
}

/** The tab's loading status. */
type tabStatus =
  | @as("unloaded") Unloaded
  | @as("loading") Loading
  | @as("complete") Complete

type tab = {
  /** Whether the tab is active in its window. Does not necessarily mean the window is focused. */
  active: bool,
  /** Whether the tab has produced sound over the past couple of seconds (but it might not be heard if also muted). 
     Equivalent to whether the 'speaker audio' indicator is showing. 
     */
  audible?: bool,
  /** Whether the tab can be discarded automatically by the browser when resources are low. */
  autoDiscardable: bool,
  /** Whether the tab is discarded. 
     A discarded tab is one whose content has been unloaded from memory, but is still visible in the tab strip. 
     Its content is reloaded the next time it is activated. 
     */
  discarded: bool,
  /** The URL of the tab's favicon. 
     This property is only present if the extension's manifest includes the "tabs" permission. 
     It may also be an empty string if the tab is loading. 
     */
  favIconUrl?: string,
  /** Whether the tab is frozen. 
   A frozen tab cannot execute tasks, including event handlers or timers. 
   It is visible in the tab strip and its content is loaded in memory. 
   It is unfrozen on activation. 
   */
  frozen: bool,
  /** The ID of the group that the tab belongs to. */
  groupId: int,
  /** The height of the tab in pixels. */
  height?: int,
  /** Whether the tab is highlighted. */
  highlighted: bool,
  /** The ID of the tab. 
     Tab IDs are unique within a browser session. 
     Under some circumstances a tab may not be assigned an ID; for example, when querying foreign tabs using the sessions API, in which case a session ID may be present. 
     Tab ID can also be set to chrome.tabs.TAB_ID_NONE for apps and devtools windows. 
     */
  id?: int,
  /** Whether the tab is in an incognito window. */
  incognito: bool,
  /** The zero-based index of the tab within its window. */
  index: int,
  /** The last time the tab became active in its window as the number of milliseconds since epoch. */
  lastAccessed: int,
  /** The tab's muted state and the reason for the last state change. */
  mutedInfo?: mutedInfo,
  /** The ID of the tab that opened this tab, if any. 
     This property is only present if the opener tab still exists. 
     */
  openerTabId?: int,
  /** The URL the tab is navigating to, before it has committed. T
     his property is only present if the extension's manifest includes the "tabs" permission and there is a pending navigation.
      */
  pendingUrl?: string,
  /** Whether the tab is pinned. */
  pinned: bool,
  /** The session ID used to uniquely identify a tab obtained from the sessions API. */
  sessioId?: string,
  /** The tab's loading status. */
  status?: tabStatus,
  /** The title of the tab. 
   This property is only present if the extension has the "tabs" permission or has host permissions for the page. 
   */
  title?: string,
  /** The last committed URL of the main frame of the tab. 
   This property is only present if the extension has the "tabs" permission or has host permissions for the page. 
   May be an empty string if the tab has not yet committed. 
   */
  url?: string,
  /** The width of the tab in pixels. */
  width?: int,
  /** The ID of the window that contains the tab. */
  windowId: int,
}

/** The type of window. */
type windowType =
  | @as("normal") Normal
  | @as("popup") Popup
  | @as("panel") Panel
  | @as("app") App
  | @as("devtools") DevTools

/** Defines how zoom changes are handled, i.e., which entity is responsible for the actual scaling of the page; defaults to automatic. */
type zoomSettingsMode =
  | /** Zoom changes are handled automatically by the browser. */
  @as("automatic")
  Atuomatic
  | /** Overrides the automatic handling of zoom changes. T
  he onZoomChange event will still be dispatched, and it is the extension's responsibility to listen for this event and manually scale the page. 
  This mode does not support per-origin zooming, and thus ignores the scope zoom setting and assumes per-tab. 
  */
  @as("manual")
  Manual
  | /** Disables all zooming in the tab. 
  The tab reverts to the default zoom level, and all attempted zoom changes are ignored. 
  */
  @as("disabled")
  Disabled

/** Defines whether zoom changes persist for the page's origin, or only take effect in this tab; defaults to per-origin when in automatic mode, and per-tab otherwise. */
type zoomSettingsScope =
  | /** Zoom changes persist in the zoomed page's origin, i.e., all other tabs navigated to that same origin are zoomed as well.
 Moreover, per-origin zoom changes are saved with the origin, meaning that when navigating to other pages in the same origin, they are all zoomed to the same zoom factor. 
 The per-origin scope is only available in the automatic mode. 
 */
  @as("per-origin")
  PerOrigin
  | /** Zoom changes only take effect in this tab, and zoom changes in other tabs do not affect the zooming of this tab. 
   Also, per-tab zoom changes are reset on navigation; navigating a tab always loads pages with their per-origin zoom factors. 
   */
  @as("per-tab")
  PerTab

/** Defines how zoom changes in a tab are handled and at what scope. */
type zoomSettings = {
  /** Used to return the default zoom level for the current tab in calls to tabs.getZoomSettings. */
  defaultZoomFactor?: int,
  /** Defines how zoom changes are handled, i.e., which entity is responsible for the actual scaling of the page; defaults to automatic. */
  mode?: zoomSettingsMode,
  /** Defines whether zoom changes persist for the page's origin, or only take effect in this tab; defaults to per-origin when in automatic mode, and per-tab otherwise. */
  scope?: zoomSettingsScope,
}

/** Captures the visible area of the currently active tab in the specified window. 
 In order to call this method, the extension must have either the <all_urls> permission or the activeTab permission. 
 In addition to sites that extensions can normally access, this method allows extensions to capture sensitive sites that are otherwise restricted, including chrome:-scheme pages, other extensions' pages, and data: URLs. 
 These sensitive sites can only be captured with the activeTab permission. 
 File URLs may be captured only if the extension has been granted file access.
 */
@val
external captureVisibleTab: (
  ~windowId: int=?,
  ~options: Chrome__ExtensionTypes.imageDetails=?,
) => promise<string> = "chrome.tabs.captureVisibleTab"

/** Captures the visible area of the currently active tab in the specified window. 
 In order to call this method, the extension must have either the <all_urls> permission or the activeTab permission. 
 In addition to sites that extensions can normally access, this method allows extensions to capture sensitive sites that are otherwise restricted, including chrome:-scheme pages, other extensions' pages, and data: URLs. 
 These sensitive sites can only be captured with the activeTab permission. 
 File URLs may be captured only if the extension has been granted file access.
 */
@val
external captureVisibleTabWithCallback: (
  ~windowId: int=?,
  ~options: Chrome__ExtensionTypes.imageDetails=?,
  string => unit,
) => unit = "chrome.tabs.captureVisibleTab"
