/** Fires when the active tab in a window changes. 
 Note that the tab's URL may not be set at the time this event fired, but you can listen to onUpdated events so as to be notified when a URL is set.
*/
module OnActivated = {
  @val
  external addListener: (TabsTypes.activeInfo => unit) => unit =
    "chrome.tabs.onActivated.addListener"
}

/** Fired when a tab is attached to a window; for example, because it was moved between windows. */
module OnAttached = {
  @val
  external addListener: (TabsTypes.activeInfo => unit) => unit =
    "chrome.tabs.onAttached.addListener"
}

/** Fired when a tab is created. 
 Note that the tab's URL and tab group membership may not be set at the time this event is fired, but you can listen to onUpdated events so as to be notified when a URL is set or the tab is added to a tab group. 
 */
module OnCreated = {
  @val
  external addListener: (TabsTypes.tab => unit) => unit = "chrome.tabs.onCreated.addListener"
}

/** Fired when a tab is detached from a window; for example, because it was moved between windows.*/
module OnDetached = {
  @val
  external addListener: (TabsTypes.detachInfo => unit) => unit =
    "chrome.tabs.onDetached.addListener"
}

/** Fired when the highlighted or selected tabs in a window changes.*/
module OnHighlighted = {
  @val
  external addListener: (TabsTypes.highlightedInfo => unit) => unit =
    "chrome.tabs.onHighlighted.addListener"
}

/** Fired when a tab is moved within a window. 
 Only one move event is fired, representing the tab the user directly moved. 
 Move events are not fired for the other tabs that must move in response to the manually-moved tab. 
 This event is not fired when a tab is moved between windows.
*/
module OnMoved = {
  @val
  external addListener: ((int, TabsTypes.moveInfo) => unit) => unit =
    "chrome.tabs.onMoved.addListener"
}

/** Fired when a tab is closed. */
module OnRemoved = {
  @val
  external addListener: ((int, TabsTypes.removeInfo) => unit) => unit =
    "chrome.tabs.onRemoved.addListener"
}

/** Fired when a tab is replaced with another tab due to prerendering or instant. */
module OnReplaced = {
  @val
  external addListener: ((int, int) => unit) => unit = "chrome.tabs.onReplaced.addListener"
}

/** Fired when a tab is updated.*/
module OnUpdated = {
  @val
  external addListener: ((int, TabsTypes.changeInfo, TabsTypes.tab) => unit) => unit =
    "chrome.tabs.onUpdated.addListener"
}

/** Fired when a tab is zoomed. */
module OnZoomChange = {
  @val
  external addListener: (TabsTypes.zoomChangeInfo => unit) => unit =
    "chrome.tabs.onZoomChange.addListener"
}
