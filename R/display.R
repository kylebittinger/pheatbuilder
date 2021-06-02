#' Set display style for heatmap
#'
#' @param ph Heatmap of class "pheat"
#' @param border_color Border color for cells
#' @param fontsize Base font size for heatmap
#' @param title Title of heatmap
#' @param height,width Row height and column width. If set to \code{NA}, the
#'   size varies according to the available space
#' @param show_names Show row or column names
#' @param fontsize Font size for row or column names
#' @param gaps Location of gaps between rows or columns. Gaps are located
#'   \emph{after} the specified locations in the heatmap, moving from top to
#'   bottom for rows and left to right for columns. As a convenience, the user
#'   may provide a vector of row names after which gaps are to be placed.
#' @param labels Custom labels to use in place of the row or column names in
#'   the data
#' @param dendrogram_width,dendrogram_height Width and height of dendrograms
#'   for rows and columns, respectively, in points. If set to NA, the default
#'   value of 50 points will be used.
#' @return A modified heatmap of class "pheat"
#' @name pheat_display
#' @examples
#' ph <- pheat(vendor_props)
#'
#' # No border
#' pheat_display_main(ph, border_color = NA)
#'
#' # Gaps between bacterial phyla
#' pheat_display_rows(ph, gaps = c(5, 10))
#'
#' # Re-label samples
#' pheat_display_cols(ph, labels = paste("Sample", 1:30))
NULL

#' @rdname pheat_display
#' @export
pheat_display_main <- function (ph,
                                border_color = "grey60",
                                fontsize = 10,
                                title = NA) {
  ph$border_color <- border_color
  ph$fontsize <- fontsize
  ph$main <- title
  ph
}

#' @rdname pheat_display
#' @export
pheat_display_rows <- function (ph,
                                height = 10,
                                show_names = TRUE,
                                fontsize = NA,
                                gaps = NULL,
                                labels = NULL,
                                dendrogram_width = NA) {
  ph$cellheight <- height
  ph$show_rownames <- show_names
  # If fontsize is not given, we leave it out of the resultant object
  # so fontsize can be determined during the call to pheatmap
  if (not_scalar_na(fontsize)) {
    ph$fontsize_row <- fontsize
  }
  if (is.character(gaps)) {
    gaps <- match(gaps, rownames(ph$mat))
  }
  ph$gaps_row <- gaps
  ph$labels_row <- labels
  if (not_scalar_na(dendrogram_width)) {
    ph$treeheight_row <- dendrogram_width
  }
  ph
}

#' @rdname pheat_display
#' @export
pheat_display_cols <- function (ph,
                                width = 10,
                                show_names = TRUE,
                                fontsize = NA,
                                gaps = NULL,
                                labels = NULL,
                                dendrogram_height = NA) {
  ph$cellwidth <- width
  ph$show_colnames <- show_names
  if (not_scalar_na(fontsize)) {
    ph$fontsize_col <- fontsize
  }
  if (is.character(gaps)) {
    gaps <- match(gaps, colnames(ph$mat))
  }
  ph$gaps_col <- gaps
  ph$labels_col <- labels
  if (not_scalar_na(dendrogram_height)) {
    ph$treeheight_col <- dendrogram_height
  }
  ph
}
