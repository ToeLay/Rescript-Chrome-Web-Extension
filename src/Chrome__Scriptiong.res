/** Injects a script into a target context. 
 By default, the script will be run at document_idle, or immediately if the page has already loaded. 
 If the injectImmediately property is set, the script will inject without waiting, even if the page has not finished loading. 
 If the script evaluates to a promise, the browser will wait for the promise to settle and return the resulting value. 
 */
@val
external executeScript: ScriptingTypes.scriptInjection => promise<
  array<ScriptingTypes.injectionResult>,
> = "chrome.scripting.executeScript"

/** Injects a script into a target context. 
 By default, the script will be run at document_idle, or immediately if the page has already loaded. 
 If the injectImmediately property is set, the script will inject without waiting, even if the page has not finished loading. 
 If the script evaluates to a promise, the browser will wait for the promise to settle and return the resulting value. 
 */
@val
external executeScriptWithCallback: (
  ScriptingTypes.scriptInjection,
  array<ScriptingTypes.injectionResult> => unit,
) => unit = "chrome.scripting.executeScript"

/** Returns all dynamically registered content scripts for this extension that match the given filter. */
@val
external getRegisteredContentScripts: (
  ~filter: ScriptingTypes.contentScriptFilter=?,
) => promise<array<ScriptingTypes.registeredContentScript>> =
  "chrome.scripting.getRegisteredContentScripts"

/** Returns all dynamically registered content scripts for this extension that match the given filter. */
@val
external getRegisteredContentScriptsWithCallback: (
  ~filter: ScriptingTypes.contentScriptFilter=?,
  array<ScriptingTypes.registeredContentScript> => unit,
) => unit = "chrome.scripting.getRegisteredContentScripts"

/** Inserts a CSS stylesheet into a target context. 
 If multiple frames are specified, unsuccessful injections are ignored. 
 */
@val
external insertCSS: ScriptingTypes.cssInjection => promise<unit> = "chrome.scripting.insertCSS"

/** Inserts a CSS stylesheet into a target context. 
 If multiple frames are specified, unsuccessful injections are ignored. 
 */
@val
external insertCSSWithCallback: (ScriptingTypes.cssInjection, unit => unit) => unit =
  "chrome.scripting.insertCSS"

/** Registers one or more content scripts for this extension. */
@val
external registerContentScripts: array<ScriptingTypes.registeredContentScript> => promise<unit> =
  "chrome.scripting.registerContentScripts"

/** Registers one or more content scripts for this extension. */
@val
external registerContentScriptsWtihCallback: (
  array<ScriptingTypes.registeredContentScript>,
  unit => unit,
) => unit = "chrome.scripting.registerContentScripts"

/** Removes a CSS stylesheet that was previously inserted by this extension from a target context.*/
@val
external removeCSS: ScriptingTypes.cssInjection => promise<unit> = "chrome.scripting.removeCSS"

/** Removes a CSS stylesheet that was previously inserted by this extension from a target context.*/
@val
external removeCSSWithCallback: (ScriptingTypes.cssInjection, unit => unit) => unit =
  "chrome.scripting.removeCSS"

/** Unregisters content scripts for this extension. */
@val
external unregisterContentScripts: (
  ~filter: ScriptingTypes.contentScriptFilter=?,
) => promise<unit> = "chrome.scripting.unregisterContentScripts"

/** Unregisters content scripts for this extension. */
@val
external unregisterContentScriptsWithCallback: (
  ~filter: ScriptingTypes.contentScriptFilter=?,
  unit => unit,
) => unit = "chrome.scripting.unregisterContentScripts"

/** Updates one or more content scripts for this extension.*/
@val
external updateContentScripts: array<ScriptingTypes.registeredContentScript> => promise<unit> =
  "chrome.scripting.updateContentScripts"

/** Updates one or more content scripts for this extension.*/
@val
external updateContentScriptsWithCallback: (
  array<ScriptingTypes.registeredContentScript>,
  unit => unit,
) => unit = "chrome.scripting.updateContentScripts"
