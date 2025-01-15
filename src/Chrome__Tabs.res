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

/** Connects to the content script(s) in the specified tab. 
 The runtime.onConnect event is fired in each content script running in the specified tab for the current extension. 
 */
@val
external connect: (int, ~connectInfo: TabsTypes.connectInfo=?) => RuntimeTypes.Port.t =
  "chrome.tabs.connect"

/** Creates a new tab.*/
@val
external create: TabsTypes.createProperties => promise<TabsTypes.tab> = "chrome.tabs.create"

/** Creates a new tab.*/
@val
external createWithCallback: (TabsTypes.createProperties, TabsTypes.tab => unit) => unit =
  "chrome.tabs.create"

/** Detects the primary language of the content in a tab. */
@val
external detectLanguage: (~tabId: int=?) => promise<string> = "chrome.tabs.detectLanguage"

/** Detects the primary language of the content in a tab. */
@val
external detectLanguageWithCallback: (~tabId: int=?, string => unit) => unit =
  "chrome.tabs.detectLanguage"

/** Discards a tab from memory. Discarded tabs are still visible on the tab strip and are reloaded when activated. */
@val
external discard: (~tabId: int=?) => promise<option<TabsTypes.tab>> = "chrome.tabs.discard"

/** Discards a tab from memory. Discarded tabs are still visible on the tab strip and are reloaded when activated. */
@val
external discardWithCallback: (~tabId: int=?, option<TabsTypes.tab> => unit) => unit =
  "chrome.tabs.discard"

/** Duplicates a tab. */
@val
external duplicate: int => promise<option<TabsTypes.tab>> = "chrome.tabs.duplicate"

/** Duplicates a tab. */
@val
external duplicateWithCallback: (int, option<TabsTypes.tab> => unit) => unit =
  "chrome.tabs.duplicate"

/** Retrieves details about the specified tab. */
@val
external get: int => promise<TabsTypes.tab> = "chrome.tabs.get"

/** Retrieves details about the specified tab. */
@val
external getWithCallback: (int, TabsTypes.tab => unit) => unit = "chrome.tabs.get"

/** Gets the tab that this script call is being made from. 
 Returns undefined if called from a non-tab context (for example, a background page or popup view).
 */
@val
external getCurrent: unit => promise<option<TabsTypes.tab>> = "chrome.tabs.getCurrent"

/** Gets the tab that this script call is being made from. 
 Returns undefined if called from a non-tab context (for example, a background page or popup view).
 */
@val
external getCurrentWithCallback: (option<TabsTypes.tab> => unit) => unit = "chrome.tabs.getCurrent"

/** Gets the current zoom factor of a specified tab. */
@val
external getZoom: (~tabId: int=?) => promise<float> = "chrome.tabs.getZoom"

/** Gets the current zoom factor of a specified tab. */
@val
external getZoomWithCallback: (~tabId: int=?, float => unit) => unit = "chrome.tabs.getZoom"

/** Gets the current zoom settings of a specified tab. */
@val
external getZoomSettings: (~tabId: int=?) => promise<TabsTypes.zoomSettings> =
  "chrome.tabs.getZoomSettings"

/** Gets the current zoom settings of a specified tab. */
@val
external getZoomSettingsWithCallback: (~tabId: int=?, TabsTypes.zoomSettings => unit) => unit =
  "chrome.tabs.getZoomSettings"

/** Go back to the previous page, if one is available.*/
@val
external goBack: (~tabId: int=?) => promise<unit> = "chrome.tabs.goBack"

/** Go back to the previous page, if one is available.*/
@val
external goBackWithCallback: (~tabId: int=?, unit => unit) => unit = "chrome.tabs.goBack"

/** Go foward to the next page, if one is available. */
@val
external goForward: (~tabId: int=?) => promise<unit> = "chrome.tabs.goForward"

/** Go foward to the next page, if one is available. */
@val
external goForwardWithCallback: (~tabId: int=?, unit => unit) => unit = "chrome.tabs.goForward"

/** Adds one or more tabs to a specified group, or if no group is specified, adds the given tabs to a newly created group. */
@val
external group: TabsTypes.groupCreateOptions => promise<int> = "chrome.tabs.group"

/** Adds one or more tabs to a specified group, or if no group is specified, adds the given tabs to a newly created group. */
@val
external groupWithCallback: (TabsTypes.groupCreateOptions, int => unit) => unit =
  "chrome.tabs.group"

/** Highlights the given tabs and focuses on the first of group. 
 Will appear to do nothing if the specified tab is currently active. 
 */
@val
external highlight: (unit => unit, int) => float = "chrome.tabs.highlight"
// TODO add support for hightlight (need windows type)

/** Moves one or more tabs to a new position within its window, or to a new window.
  Note that tabs can only be moved to and from normal (window.type === "normal") windows.
  */
@val
external moveOne: (int, TabsTypes.moveProperties) => promise<TabsTypes.tab> = "chrome.tabs.move"

/** Moves one or more tabs to a new position within its window, or to a new window.
  Note that tabs can only be moved to and from normal (window.type === "normal") windows.
  */
@val
external moveOneWithCallback: (int, TabsTypes.moveProperties, TabsTypes.tab => unit) => unit =
  "chrome.tabs.move"

/** Moves one or more tabs to a new position within its window, or to a new window.
  Note that tabs can only be moved to and from normal (window.type === "normal") windows.
  */
@val
external move: (array<int>, TabsTypes.moveProperties) => promise<array<TabsTypes.tab>> =
  "chrome.tabs.move"

/** Moves one or more tabs to a new position within its window, or to a new window.
  Note that tabs can only be moved to and from normal (window.type === "normal") windows.
  */
@val
external moveWithCallback: (
  array<int>,
  TabsTypes.moveProperties,
  array<TabsTypes.tab> => unit,
) => unit = "chrome.tabs.move"

/** Gets all tabs that have the specified properties, or all tabs if no properties are specified. */
@val
external query: TabsTypes.queryInfo => promise<array<TabsTypes.tab>> = "chrome.tabs.query"

/** Gets all tabs that have the specified properties, or all tabs if no properties are specified. */
@val
external queryWithCallback: (TabsTypes.queryInfo, array<TabsTypes.tab> => unit) => unit =
  "chrome.tabs.query"

/** Reload a tab. */
@val
external reload: (
  ~tabId: int=?,
  ~realoadProperties: TabsTypes.realoadProperties=?,
) => promise<unit> = "chrome.tabs.reload"

/** Reload a tab. */
@val
external reloadWithCallback: (
  ~tabId: int=?,
  ~realoadProperties: TabsTypes.realoadProperties=?,
  unit => unit,
) => unit = "chrome.tabs.reload"

/** Closes one or more tabs. */
@val
external remove: array<int> => promise<unit> = "chrome.tabs.remove"

/** Closes one or more tabs. */
@val
external removeWithCallback: (array<int>, unit => unit) => unit = "chrome.tabs.remove"

/** Sends a single message to the content script(s) in the specified tab, with an optional callback to run when a response is sent back. 
 The runtime.onMessage event is fired in each content script running in the specified tab for the current extension. 
 */
@val
external sendMessage: (int, JSON.t, ~options: TabsTypes.sendMessageOptions) => promise<JSON.t> =
  "chrome.tabs.sendMessage"

/** Sends a single message to the content script(s) in the specified tab, with an optional callback to run when a response is sent back. 
 The runtime.onMessage event is fired in each content script running in the specified tab for the current extension. 
 */
@val
external sendMessageWithCallback: (
  int,
  JSON.t,
  ~options: TabsTypes.sendMessageOptions=?,
  JSON.t => unit,
) => unit = "chrome.tabs.sendMessage"

/** Zooms a specified tab. */
@val
external setZoom: (~tabId: int=?, float) => promise<unit> = "chrome.tabs.setZoom"

/** Zooms a specified tab. */
@val
external setZoomWithCallback: (~tabId: int=?, float, unit => unit) => unit = "chrome.tabs.setZoom"

/** Sets the zoom settings for a specified tab, which define how zoom changes are handled. 
 These settings are reset to defaults upon navigating the tab. 
 */
@val
external setZoomSettings: (~tabId: int=?, TabsTypes.zoomSettings) => promise<unit> =
  "chrome.tabs.setZoomSettings"

/** Sets the zoom settings for a specified tab, which define how zoom changes are handled. 
 These settings are reset to defaults upon navigating the tab. 
 */
@val
external setZoomSettingsWithCallback: (
  ~tabId: int=?,
  TabsTypes.zoomSettings,
  unit => unit,
) => unit = "chrome.tabs.setZoomSettings"

/** Removes one or more tabs from their respective groups. If any groups become empty, they are deleted. */
@val
external ungroup: array<int> => promise<unit> = "chrome.tabs.ungroup"

/** Removes one or more tabs from their respective groups. If any groups become empty, they are deleted. */
@val
external ungroupWithCallback: (array<int>, unit => unit) => unit = "chrome.tabs.ungroup"

/** Modifies the properties of a tab. 
 Properties that are not specified in updateProperties are not modified.
 */
@val
external update: (~tabId: int=?, TabsTypes.updateProperties) => promise<option<TabsTypes.tab>> =
  "chrome.tabs.update"

/** Modifies the properties of a tab. 
 Properties that are not specified in updateProperties are not modified.
 */
@val
external updateWithCallback: (
  ~tabId: int=?,
  TabsTypes.updateProperties,
  option<TabsTypes.tab> => unit,
) => unit = "chrome.tabs.update"

// Event modules
module OnActivated = TabsEvents.OnActivated

module OnAttached = TabsEvents.OnAttached

module OnCreated = TabsEvents.OnCreated

module OnDetached = TabsEvents.OnDetached

module OnHighlighted = TabsEvents.OnHighlighted

module OnMoved = TabsEvents.OnMoved

module OnRemoved = TabsEvents.OnRemoved

module OnReplaced = TabsEvents.OnReplaced

module OnUpdated = TabsEvents.OnUpdated

module OnZoomChange = TabsEvents.OnZoomChange
