type contentScriptFilter = {ids: array<string>}

/** The origin for a style change. */
type styleOrigin =
  | @as("AUTHOR") Author
  | @as("USER") User

type injectionTarget = {
  /** Whether the script should inject into all frames within the tab. 
 Defaults to false. 
 This must not be true if frameIds is specified. 
 */
  allFrames?: bool,
  /** The IDs of specific documentIds to inject into.
  This must not be set if frameIds is set. 
*/
  documentIds?: array<string>,
  /** The IDs of specific frames to inject into. */
  frameIds?: array<int>,
  /** The ID of the tab into which to inject. */
  tabId: int,
}

type cssInjection = {
  /** A string containing the CSS to inject. Exactly one of files and css must be specified. */
  css?: string,
  /** The path of the CSS files to inject, relative to the extension's root directory. 
 Exactly one of files and css must be specified. 
 */
  files?: array<string>,
  /** The style origin for the injection. Defaults to 'AUTHOR'. */
  origin?: styleOrigin,
  /** Details specifying the target into which to insert the CSS. */
  target: injectionTarget,
}

/** The JavaScript world for a script to execute within. */
type executionWorld =
  | /** Specifies the isolated world, which is the execution environment unique to this extension. */
  @as("ISOLATED")
  Isolated

  | /** Specifies the main world of the DOM, which is the execution environment shared with the host page's JavaScript. */
  @as("MAIN")
  Main

type injectionResult = {
  /** The document associated with the injection. */
  documentId: string,
  /** The frame associated with the injection. */
  frameId: int,
  /** The result of the script execution. */
  result: JSON.t,
}

type registeredContentScript = {
  /** If specified true, it will inject into all frames, even if the frame is not the top-most frame in the tab. 
     Each frame is checked independently for URL requirements; it will not inject into child frames if the URL requirements are not met. 
     Defaults to false, meaning that only the top frame is matched. 
     */
  allFrames?: bool,
  /** The list of CSS files to be injected into matching pages. 
 These are injected in the order they appear in this array, before any DOM is constructed or displayed for the page. 
 */
  css?: array<string>,
  /** Excludes pages that this content script would otherwise be injected into. */
  excludeMatches?: array<string>,
  /** The id of the content script, specified in the API call. 
 Must not start with a '_' as it's reserved as a prefix for generated script IDs. 
 */
  id: string,
  /** The list of JavaScript files to be injected into matching pages. 
 These are injected in the order they appear in this array. 
 */
  js?: array<string>,
  /** Indicates whether the script can be injected into frames where the URL contains an unsupported scheme; specifically: about:, data:, blob:, or filesystem:. 
 In these cases, the URL's origin is checked to determine if the script should be injected. 
 If the origin is null (as is the case for data: URLs) then the used origin is either the frame that created the current frame or the frame that initiated the navigation to this frame.
  Note that this may not be the parent frame. 
  */
  matchOriginAsFallback?: bool,
  /** Specifies which pages this content script will be injected into. 
 Must be specified for registerContentScripts. 
 */
  matches?: array<string>,
  /** Specifies if this content script will persist into future sessions. The default is true. */
  persistAcrossSessions?: bool,
  /** Specifies when JavaScript files are injected into the web page. The preferred and default value is document_idle. */
  runAt?: Chrome__ExtensionTypes.runAt,
  /** The JavaScript "world" to run the script in. Defaults to ISOLATED. */
  world?: executionWorld,
}

type scriptInjection = {
  /** The arguments to pass to the provided function. 
     This is only valid if the func parameter is specified. 
     These arguments must be JSON-serializable. 
     */
  args?: array<JSON.t>,
  /** The path of the JS or CSS files to inject, relative to the extension's root directory. 
 Exactly one of files or func must be specified. 
 */
  files?: array<string>,
  /** Whether the injection should be triggered in the target as soon as possible. 
 Note that this is not a guarantee that injection will occur prior to page load, as the page may have already loaded by the time the script reaches the target. 
 */
  injectImmediately?: bool,
  /** Details specifying the target into which to inject the script. */
  target: injectionTarget,
  /** The JavaScript "world" to run the script in. Defaults to ISOLATED. */
  world?: executionWorld,
  /** A JavaScript function to inject. 
   This function will be serialized, and then deserialized for injection. 
   This means that any bound parameters and execution context will be lost. 
   Exactly one of files or func must be specified. 
   */
  func: unit => unit,
}
