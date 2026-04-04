#' Print the heatmap to the screen
#' @param x Heatmap of class "pheat"
#' @param ... Additional arguments passed to other methods
#' @export
print.pheat <- function(x, ...) {
  grid::grid.draw(do.call(pheatmap::pheatmap, x))
}

#' Save the heatmap to a file
#' @param ph Heatmap of class "pheat"
#' @param filename File where the heatmap will be saved
#' @param width Width of the figure
#' @param height Height of the figure
#' @return The original heatmap, invisibly. This allows the user to save the
#'   heatmap and print to the screen by calling \code{print.pheat} on the
#'   output of this function.
#' @export
pheat_save <- function(ph, filename = "heatmap.pdf", width = NA, height = NA) {
  ph_to_save <- ph
  ph_to_save$filename <- filename
  ph_to_save$width <- width
  ph_to_save$height <- height
  do.call(pheatmap::pheatmap, ph_to_save)
  invisible(ph)
}
