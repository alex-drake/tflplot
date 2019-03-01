#' A collection of colours based on the colours defined in the Transport for London (TfL)
#' Digital Design Style Guide
#' http://content.tfl.gov.uk/design-style-guide.pdf
#' note that you must refer to http://www.tfl.gov.uk/toolkit for the latest version of the document
#' The available palette list is:
#' primary
#' accent
#' underground
#' modes

#' @description Function to extract TfL colors as hex codes
#'
#' @param ... Character names of tfl_colors
#' @keywords tfl_cols
#' @export tfl_cols
tfl_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (tfl_colours)

  tfl_colours[cols]
}

## All available colours, with associated name. Note some colours may be repeated.
tfl_colours <- c(`primary blue`="#1a5a92",
                 `dark grey`="#2d3039",
                 `tfl blue`="#113b92",
                 `turqoise`="#66CCCC",
                 `white`="#FFFFFF",
                 `light grey 1`="#f7f7f7",
                `light grey 2`="#eeeeee",
                `mid grey`="#cccccc",
                `light blue`="#eff6fd",
                `mid blue`="#ccdde8",
                `green`="#e7f6dc",
                `warning yellow`="#faf5e1",
                `error red`="#ffefef",
                `bakerloo`="#996633",
                `central`="#CC3333",
                `circle`="#FFCC00",
                `district`="#006633",
                `hammersmith & city`="#CC9999",
                `jubilee`="#868F98",
                `metropolitan`="#660066",
                `northern`="#000000",
                `picadilly`="#0019a8",
                `victoria`="#0099CC",
                `waterloo & city`="#66CCCC",
                `lu blue`="#0019a8",
                `lu red`="#CC3333",
                `buses`="#CC3333",
                `dlr`="#009999",
                `tramlink`="#66CC00",
                `bch 1`="#009EE0",
                `bch 2`="#031041",
                `public carriage`="#9999CC",
                `victoria coach stn`="#FF9900",
                `london streets`="#999999",
                `river`="#0099CC",
                `dial-a-ride`="#CC33CC",
                `emirates air line`="#D9002A",
                `overground`="#e87722",
                `elizabeth line`="#6950a1")

#' Define the tfl colour palettes as named entities
#'
#' @keywords tfl_palettes
#'
#' @export tfl_palettes
## Palette collections
tfl_palettes <- list(
  `primary` = tfl_cols("primary blue","dark grey","tfl blue","turqoise","white"),
  `accent` = tfl_cols("light grey 1","light grey 2","mid grey","light blue","mid blue","green","warning yellow","error red"),
  `underground` = tfl_cols("bakerloo","central","circle","district","hammersmith & city","jubilee","metropolitan","northern","picadilly","victoria","waterloo & city"),
  `modes` = tfl_cols("lu blue","lu red","buses","dlr","tramlink","bch 1","bch 2","public carriage","victoria coach stn","london streets","river","dial-a-ride","emirates air line","overground","elizabeth line")
)
