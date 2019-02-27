#' Return function to interpolate a tfl colour palette
#'
#' @param palette Character name of palette in tfl_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
tfl_pal <- function(palette = "underground", reverse = FALSE, ...) {
  pal <- tfl_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}
#' Color scale constructor for tfl colours
#'
#' @param palette Character name of palette in tfl_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_color_tfl <- function(palette = "underground", discrete = TRUE, reverse = FALSE, ...) {
  pal <- tfl_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("tfl_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for tfl colours
#'
#' @param palette Character name of palette in tfl_palettes
#' @param discrete Boolean indicating whether colour aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
scale_fill_tfl <- function(palette = "underground", discrete = TRUE, reverse = FALSE, ...) {
  pal <- drsimonj_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("tfl_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}
