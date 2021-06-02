#' Print the heatmap to the screen
#' @param ph Heatmap of class "pheat"
#' @export
print.pheat <- function (ph, ...) {
  pheatmap:::print.pheatmap(do.call(pheatmap::pheatmap, ph))
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
pheat_save <- function (ph, filename = "heatmap.pdf",
                        width = NA, height = NA) {
  ph_to_save <- ph
  ph_to_save$filename <- filename
  ph_to_save$width <- width
  ph_to_save$height <- height
  do.call(pheatmap::pheatmap, ph_to_save)
  invisible(ph)
}
