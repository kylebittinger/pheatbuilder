#' Build a pheatmap object in stages
#'
#' @param x A matrix or data frame of data for the heatmap
#' @param ... Additional arguments passed to other methods
#' @examples
#' pheat(vendor_props)
#' @export
pheat <- function (x, ...) {
  UseMethod("pheat")
}

#' @rdname pheat
#' @export
pheat.matrix <- function (x) {
  obj <- list(
    mat = x,
    cluster_rows = FALSE,
    cluster_cols = FALSE,
    cellwidth = 10,
    cellheight = 10)
  class(obj) <- "pheat"
  obj
}

#' @rdname pheat
#' @param rownames_in The column of the data frame that gives the rownames
#'   for the heatmap. Can be specified as an integer index or with the column
#'   name in quotes. Set to \code{NULL} to use the existing rownames of the
#'   data frame.
#' @export
#' @examples
#'
#' # Re-format heatmap data in a data frame
#' vendor_props_df <- data.frame(
#'   taxon_id = rownames(vendor_props),
#'   vendor_props[,1:15])
#' rownames(vendor_props_df) <- NULL
#' pheat(vendor_props_df, rownames_in = "taxon_id")
pheat.data.frame <- function (x, rownames_in = 1) {
  x <- make_rownames(x, rownames_in)
  x <- as.matrix(x)
  pheat.matrix(x)
}
