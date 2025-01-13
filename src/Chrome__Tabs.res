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
  /** The ID of the group that the tab belongs to. */
  groupId?: int,
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
  ingognito: bool,
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
}
