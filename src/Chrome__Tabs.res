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

/** Gets all tabs that have the specified properties, or all tabs if no properties are specified. */
@val
external query: TabsTypes.queryInfo => promise<array<TabsTypes.tab>> = "chrome.tabs.query"

/** Gets all tabs that have the specified properties, or all tabs if no properties are specified. */
@val
external queryWithCallback: (TabsTypes.queryInfo, array<TabsTypes.tab> => unit) => unit =
  "chrome.tabs.query"

/** ends a single message to the content script(s) in the specified tab, with an optional callback to run when a response is sent back. 
 The runtime.onMessage event is fired in each content script running in the specified tab for the current extension. 
 */
@val
external sendMessage: (int, JSON.t, ~options: TabsTypes.sendMessageOptions) => promise<JSON.t> =
  "chrome.tabs.sendMessage"

/** ends a single message to the content script(s) in the specified tab, with an optional callback to run when a response is sent back. 
 The runtime.onMessage event is fired in each content script running in the specified tab for the current extension. 
 */
@val
external sendMessageWithCallback: (
  int,
  JSON.t,
  ~options: TabsTypes.sendMessageOptions=?,
  JSON.t => unit,
) => unit = "chrome.tabs.sendMessage"

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
