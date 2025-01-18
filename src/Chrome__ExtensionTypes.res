/** The format of an image. */
type imageFormat =
  | @as("jpeg") JPEG
  | @as("png") PNG

/** Details about the format and quality of an image. */
type imageDetails = {
  /** The format of the resulting image. Default is "jpeg". */
  format?: imageFormat,
  /** When format is "jpeg", controls the quality of the resulting image. 
   This value is ignored for PNG images. 
   As quality is decreased, the resulting image will have more visual artifacts, and the number of bytes needed to store it will decrease. 
   */
  quality?: int,
}

/** The soonest that the JavaScript or CSS will be injected into the tab. */
type runAt =
  | /** Script is injected after any files from css, but before any other DOM is constructed or any other script is run. */
  @as("document_start")
  DocumentStart

  | /** Script is injected immediately after the DOM is complete, but before subresources like images and frames have loaded. */
  @as("document_end")
  DocumentEnd

  | /** The browser chooses a time to inject the script between "document_end" and immediately after the window.onload event fires. 
  The exact moment of injection depends on how complex the document is and how long it is taking to load, and is optimized for page load speed. 
  Content scripts running at "document_idle" don't need to listen for the window.onload event; they are guaranteed to run after the DOM completes. 
  If a script definitely needs to run after window.onload, the extension can check if onload has already fired by using the document.readyState property. 
  */
  @as("document_idle")
  DocumentIdle
