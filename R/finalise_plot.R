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

save_plot <- function (plot_grid, width, height, save_filepath, bg) {
  grid::grid.draw(plot_grid)

  #save it
  ggplot2::ggsave(filename = save_filepath,
                  plot=plot_grid, width=(width/72), height=(height/72),  bg=bg)
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
#' Running this will create the footer, including the required image/logo - not currently used
#'
#' @keywords create_footer
#' @param caption the text to be used for the caption - can be left blank
#' @param logo_image_path File path for the logo image you want to use in the right hand side of your chart,
#'
#' @export create_footer
create_footer <- function (caption, logo_image_path) {
  #Make the footer
  footer <- grid::grobTree(grid::linesGrob(x = grid::unit(c(0, 1), "npc"), y = grid::unit(1.1, "npc")),
                           grid::textGrob(caption,
                                          x = 0.004, hjust = 0, gp = grid::gpar(fontsize=16)),
                           grid::rasterGrob(png::readPNG(logo_image_path), x = 0.944))
  return(footer)

}

#' Make the figure caption
#'
#' Running this will create the figure caption, including the figure number and appropriate formatting
#'
#' @keywords create_footer
#' @param caption the text to be used for the caption - can be left blank
#' @param figure_num The number, or figure reference
#' @param width The width of the figure in pixels - defaults to 640
#'
#' @export figure_caption
figure_caption <- function (caption,
                            figure_num = "",
                            width = 640) {

  if(!is.null(figure_num)){
    figure_lead <- ifelse(nchar(figure_num) > 0,
                          paste0("Figure ",figure_num,": "),
                          "Figure: ")

    t1 <- grid::textGrob(figure_lead, x = 0.004, hjust = 0,
                         gp = grid::gpar(col = tfl_cols("lu blue"), fontsize=16,
                                         fontface="bold", fontfamily="Hammersmith"))
    t2 <- grid::textGrob(caption, hjust = 0,
                         x = ifelse(nchar(figure_num)==0,0.088,
                                    ifelse(nchar(figure_num)==1, 0.108, 0.128)),
                         gp = grid::gpar(col = tfl_cols("mid grey"), fontsize=16,
                                         fontface="bold", fontfamily="Hammersmith"))
    #Make the caption
    caption <- grid::grobTree(t1,t2)
  } else{
    caption <- grid::grobTree(grid::textGrob(caption, hjust = 0, x = 0.004,
                                             gp = grid::gpar(col = tfl_cols("mid grey"),
                                                             fontsize = 14,
                                                             fontface="bold",
                                                             fontfamily="Hammersmith")))
  }

  return(caption)
}

#' Arrange alignment and save TfL ggplot chart
#'
#' Running this function will save your plot with the assumed guidelines from the TfL Digital Design guidelines
#' It will left align your title, subtitle and source, add the TfL blocks at the bottom right and save it to your specified location.
#' @param plot_name The variable name of the plot you have created that you want to format and save
#' @param caption The text you want to come in your figure caption (top left)
#' @param figure_number The figure value to associate with your figure
#' @param save_filepath Exact filepath that you want the plot to be saved to
#' @param width_pixels Width in pixels that you want to save your chart to - defaults to 640
#' @param height_pixels Height in pixels that you want to save your chart to - defaults to 450
#' @param background_colour The colour you want for the background of your plot - defaults to white
#' @return (Invisibly) an updated ggplot object.

#' @keywords finalise_plot
#'
#' @export
finalise_plot <- function(plot_name,
                          caption = "",
                          figure_number = "",
                          save_filepath=file.path(Sys.getenv("TMPDIR"), "tmp-nc.png"),
                          width_pixels=640,
                          height_pixels=450,
                          background_colour=NULL) {

  fig_caption <- figure_caption(caption, figure_number, width = width_pixels)

  #Draw your left-aligned grid
  plot_left_aligned <- left_align(plot_name, c("subtitle", "title", "caption"))
  plot_grid <- ggpubr::ggarrange(fig_caption, plot_left_aligned,
                                 ncol = 1, nrow = 2,
                                 heights = c( 0.05/(height_pixels/450), 1))

  if(is.null(background_colour)){
    background_colour <- tfl_cols("white")
  }

  save_plot(plot_grid, width_pixels, height_pixels, save_filepath, background_colour)
  ## Return (invisibly) a copy of the graph. Can be assigned to a
  ## variable or silently ignored.
  invisible(plot_grid)
}
