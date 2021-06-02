#' Adjust the legend for the heatmap
#'
#' @param  ph Heatmap of class "pheat"
#' @param breaks Breakpoints for labels in the heatmap legend
#' @param labels Custom labels to use in the heatmap legend
#' @param show If \code{FALSE}, don't show the legend
#' @return A modified heatmap of class "pheat"
#' @export
pheat_legend <- function (ph, breaks = NA, labels = NA, show = TRUE) {
  ph$legend_breaks <- breaks
  ph$legend_labels <- labels
  ph$legend <- show
  ph
}

#' Adjust the legend for annotations in the heatmap
#'
#' @param  ph Heatmap of class "pheat"
#' @param show If \code{FALSE}, don't show the legends for annotations
#' @param show_names_row,show_names_col If \code{FALSE}, don't show names for
#'   row or column annotation tracks
#' @return A modified heatmap of class "pheat"
#' @examples
#' phc <- pheat_annotate_cols(pheat(vendor_props), vendor_samples)
#' pheat_annotation_legend(phc, show_names_col = FALSE)
#' @export
pheat_annotation_legend <- function (ph,
                                     show = TRUE,
                                     show_names_row = TRUE,
                                     show_names_col = TRUE) {
  ph$annotation_legend <- show
  ph$annotation_names_row <- show_names_row
  ph$annotation_names_col <- show_names_col
  ph
}
