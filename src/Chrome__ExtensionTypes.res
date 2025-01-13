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
