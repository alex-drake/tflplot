#' Add Transport for London (TfL) theme to ggplot chart
#'
#' This function allows you to add the TfL theme to your ggplotgraphics.
#' @keywords tfl_style
#' @export

tfl_style <- function() {
  sysfonts::font_add_google(name="Hammersmith One",family="Hammersmith")
  sysfonts::font_add_google(name="Open Sans",family = "OpenSans")
  showtext::showtext_auto() # RStudio won't render google fonts atm...
  #font <- "Helvetica" # to be replaced - should be Johnston100 but requires licence!
  #headers <- "Helvetica" # using both elements for testing within RStudio - remove in final!
  headers <- "Hammersmith"
  font <- "OpenSans"

  ggplot2::theme(

    #Text format:
    #Set the font, size, type and colour of text for the chart's title
    plot.title = ggplot2::element_text(family=headers,
                                       size=16,
                                       face="bold",
                                       color=tfl_cols("dark grey")),
    #Set the font, size, type and colour of text for the chart's subtitle,
    #as well as setting a margin between the title and the subtitle
    plot.subtitle = ggplot2::element_text(family=headers,
                                          size=12,
                                          color=tfl_cols("mid grey"),
                                          margin=ggplot2::margin(4,0,8,0)),
    plot.caption = ggplot2::element_blank(),
    plot.margin = ggplot2::margin(8,16,8,8,unit = "pt"),
    #This leaves the caption text element empty as we'll want to set this elsewhere

    #Legend format
    legend.position = "bottom",
    #legend.position = c(0,0), # bottom left
    legend.text.align = 0,
    legend.background = ggplot2::element_blank(),
    legend.title = ggplot2::element_blank(),
    legend.key = ggplot2::element_blank(),
    legend.text = ggplot2::element_text(family=font,
                                        size=12,
                                        color=tfl_cols("dark grey")),

    #Axis format
    axis.title = ggplot2::element_blank(),
    axis.text = ggplot2::element_text(family=font,
                                      size=12,
                                      color=tfl_cols("dark grey")),
    axis.text.x = ggplot2::element_text(margin=ggplot2::margin(5, b = 10)),
    axis.ticks = ggplot2::element_blank(),
    axis.line = ggplot2::element_line(color=tfl_cols("dark grey")),

    #Grid lines
    panel.grid.minor = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_line(color=tfl_cols("mid grey"), linetype = 2),
    panel.grid.major.x = ggplot2::element_blank(),

    #Blank background
    panel.background = ggplot2::element_blank(),

    #Strip background (#This sets the panel background for facet-wrapped plots to white,
    #removing the standard grey ggplot background colour and sets the title size of the
    #facet-wrap title to font size 20)
    strip.background = ggplot2::element_rect(fill=tfl_cols("white")),
    strip.text = ggplot2::element_text(size  = 12,  hjust = 0, family = font)
  )
}

#' Add Transport for London (TfL) map theme to ggplot chart
#'
#' This function allows you to add the TfL theme to your ggplotgraphics.
#' @keywords tfl_map_style
#' @export
#'
tfl_map_style <- function(){
  ggplot2::theme(
    axis.line = ggplot2::element_blank(),
    axis.text = ggplot2::element_blank(),
    axis.title = ggplot2::element_blank(),
    axis.ticks = ggplot2::element_blank(),
    panel.border = ggplot2::element_blank(),
    panel.grid = ggplot2::element_blank(),
    panel.grid.major.y = ggplot2::element_blank(),
    legend.key.width = unit(5, "char"),
    legend.text.align = 0.5
  )
}
