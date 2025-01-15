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

type connectInfo = {
  /** Open a port to a specific document identified by documentId instead of all frames in the tab. */
  documentId?: string,
  /** Open a port to a specific frame identified by frameId instead of all frames in the tab. */
  frameId?: int,
  /** Is passed into onConnect for content scripts that are listening for the connection event. */
  name?: string,
}

type createProperties = {
  /** Whether the tab should become the active tab in the window.
    Does not affect whether the window is focused (see windows.update). 
    Defaults to true. 
    */
  active?: bool,
  /** The position the tab should take in the window. 
   The provided value is clamped to between zero and the number of tabs in the window. 
   */
  index?: int,
  /** The ID of the tab that opened this tab. 
   If specified, the opener tab must be in the same window as the newly created tab. 
   */
  openerTabId?: int,
  /** Whether the tab should be pinned. Defaults to false */
  pinned?: bool,
  /** The URL to initially navigate the tab to. 
   Fully-qualified URLs must include a scheme (i.e., 'http://www.google.com', not 'www.google.com'). 
   Relative URLs are relative to the current page within the extension. 
   Defaults to the New Tab Page. 
   */
  url?: string,
  /** The window in which to create the new tab. Defaults to the current window. */
  windowId?: int,
}

type queryInfo = {
  /** Whether the tabs are active in their windows. */
  active?: bool,
  /** Whether the tabs are audible. */
  audible?: bool,
  /** Whether the tabs can be discarded automatically by the browser when resources are low. */
  autoDiscardable?: bool,
  /** Whether the tabs are in the current window. */
  currentWindow?: bool,
  /** Whether the tabs are discarded. 
 A discarded tab is one whose content has been unloaded from memory, but is still visible in the tab strip. 
 Its content is reloaded the next time it is activated. 
 */
  discarded?: bool,
  /** Whether the tabs are frozen. 
 A frozen tab cannot execute tasks, including event handlers or timers. 
 It is visible in the tab strip and its content is loaded in memory. 
 It is unfrozen on activation. 
 */
  frozen?: bool,
  /** The ID of the group that the tabs are in, or tabGroups.TAB_GROUP_ID_NONE for ungrouped tabs. */
  groupId?: int,
  /** Whether the tabs are highlighted. */
  highlighted?: bool,
  /** The position of the tabs within their windows. */
  index?: int,
  /** Whether the tabs are in the last focused window. */
  lastFocusedWindow?: bool,
  /** Whether the tabs are muted. */
  muted?: bool,
  /** Whether the tabs are pinned. */
  pinned?: bool,
  /** The tab loading status. */
  status?: tabStatus,
  /** Match page titles against a pattern. 
 This property is ignored if the extension does not have the "tabs" permission or host permissions for the page. 
 */
  title?: string,
  /** Match tabs against one or more URL patterns. 
 Fragment identifiers are not matched. 
 This property is ignored if the extension does not have the "tabs" permission or host permissions for the page. 
 */
  url?: array<string>,
  /** The ID of the parent window, or windows.WINDOW_ID_CURRENT for the current window. */
  windowId?: int,
  /** The type of window the tabs are in. */
  windowType?: windowType,
}

type sendMessageOptions = {
  /** Send a message to a specific document identified by documentId instead of all frames in the tab. */
  documentId?: string,
  /** Send a message to a specific frame identified by frameId instead of all frames in the tab. */
  frameId?: int,
}

type groupCreateProperties = {
  /** The window of the new group. Defaults to the current window. */
  windowId?: int,
}

type groupCreateOptions = {
  /** Configurations for creating a group. Cannot be used if groupId is already specified. */
  createProperties?: groupCreateProperties,
  /** The ID of the group to add the tabs to. If not specified, a new group will be created. */
  groupId?: int,
  /** List of tab IDs to add to the specified group. */
  tabIds: array<int>,
}

type highlightInfo = {
  /** Tab indices to highlight. */
  tabs: array<int>,
  /** The window that contains the tabs. */
  windowId?: int,
}

type moveProperties = {
  /** The position to move the window to. Use -1 to place the tab at the end of the window. */
  index: int,
  /** Defaults to the window the tab is currently in. */
  windowId?: int,
}

type realoadProperties = {
  /** Whether to bypass local caching. Defaults to false. */
  bypassCache?: bool,
}

type updateProperties = {
  /** Whether the tab should be active. Does not affect whether the window is focused (see windows.update). */
  active?: bool,
  /** Whether the tab should be discarded automatically by the browser when resources are low. */
  autoDiscardable?: bool,
  /** Adds or removes the tab from the current selection. */
  highlighted?: bool,
  /** Whether the tab should be muted. */
  muted?: bool,
  /** The ID of the tab that opened this tab. 
 If specified, the opener tab must be in the same window as this tab. 
 */
  openerTabId?: int,
  /** Whether the tab should be pinned. */
  pinned?: bool,
  /** A URL to navigate the tab to. 
 JavaScript URLs are not supported; use scripting.executeScript instead. 
 */
  url?: string,
}

type activeInfo = {
  /** The ID of the tab that has become active. */
  tabId: int,
  /** The ID of the window the active tab changed inside of. */
  windowId: int,
}

type attachInfo = {
  newPosition: int,
  newWindowId: int,
}

type detachInfo = {
  oldPosition: int,
  oldWindowId: int,
}

type highlightedInfo = {
  tabIds: array<int>,
  windowId: int,
}

type moveInfo = {
  fromIndex: int,
  fotIndex: int,
  windowId: int,
}

type removeInfo = {
  /** True when the tab was closed because its parent window was closed. */
  isWindowClosing: bool,
  /** The window whose tab is closed. */
  windowId: int,
}

type changeInfo = {
  /** The tab's new audible state. */
  audible?: bool,
  /** The tab's new auto-discardable state. */
  autoDiscardable?: bool,
  /** The tab's new discarded state. */
  discarded?: bool,
  /** The tab's new favicon URL. */
  favIconUrl?: string,
  /** The tab's new frozen state. */
  frozen?: bool,
  /** The tab's new group. */
  groupId?: int,
  /** The tab's new muted state and the reason for the change. */
  mutedInfo?: mutedInfo,
  /** The tab's new pinned state. */
  pinned?: bool,
  /** The tab's loading status. */
  status?: tabStatus,
  /** The tab's new title. */
  title?: string,
  /** The tab's URL if it has changed. */
  url?: string,
}

type zoomChangeInfo = {
  newZoomFactor: float,
  oldZoomFactor: float,
  tabId: int,
  zoomSettings: zoomSettings,
}
