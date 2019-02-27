#' Export the plot
#'
#' Running this will export the plot using ggsave
#'
#' @keywords save_plot
#' @param plot_grid arrange plot using a grid
#' @param width width of plot in pixels
#' @param height height of plot in pixels
#' @param save_filepath the filepath at which the plot will be saved
#'
#' @export

save_plot <- function (plot_grid, width, height, save_filepath) {
  grid::grid.draw(plot_grid)
  #save it
  ggplot2::ggsave(filename = save_filepath,
                  plot=plot_grid, width=(width/72), height=(height/72),  bg=tfl_cols("white"))
}
#' Left align
#'
#' Running this will adjust the appearance of the chart
#'
#' @keywords left_align
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param pieces elements to be left aligned
#'
#' @export
#Left align text
left_align <- function(plot_name, pieces){
  grob <- ggplot2::ggplotGrob(plot_name)
  n <- length(pieces)
  grob$layout$l[grob$layout$name %in% pieces] <- 2
  return(grob)
}

#' Make the footer
#'
#' Running this will create the footer, including the required image/logo
#'
#' @keywords create_footer
#' @param source_name the text to be used for the source reference - may want to drop this in future
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'
#' @export create_footer
create_footer <- function (source_name, logo_image_path) {
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(source_name,
                                          x = 0.004, hjust = 0, gp = grid::gpar(fontsize=16)),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.944))
  return(footer)

}

#' Arrange alignment and save TfL ggplot chart
#'
#' Running this function will save your plot with the assumed guidelines from the TfL Digital Design guidelines
#' It will left align your title, subtitle and source, add the TfL blocks at the bottom right and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param source_name The text you want to come after the text 'Source:' in the bottom left hand side of your side
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to - defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to - defaults to 450
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'  which needs to be a PNG file - defaults to TfL Roundel image that sits within the data folder of your package
#' @return (Invisibly) an updated ggplot object.

#' @keywords finalise_plot
#'
#' @export
finalise_plot <- function(plot_name,
                          source_name,
                          save_filepath=file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
                          width_pixels=640,
                          height_pixels=450,
                          logo_image_path = file.path(system.file("www", package = 'tflplot'),"placeholder.png")) {

  footer <- create_footer(source_name, logo_image_path)

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(plot_left_aligned, footer,
                                 ncol = 1, nrow = 2,
                                 heights = c(1, 0.045/(height_pixels/450)))
  ## print(paste("Saving to", save_filepath))
  save_plot(plot_grid, width_pixels, height_pixels, save_filepath)
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  invisible(plot_grid)
}

