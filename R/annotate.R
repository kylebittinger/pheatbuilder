#' Annotate rows and columns of the heatmap
#' @param ph Heatmap of class "pheat"
#' @param annotation A data frame of annotations
#' @param rownames_in The column in the annotation data frame that corresponds
#'   to the rows or columns of the data matrix for the heatmap. Set to
#'   \code{NULL} to use the existing rownames of the annotation data frame.
#' @name pheat_annotate
#' @examples
#' ph <- pheat(vendor_props)
#' pheat_annotate_rows(ph, vendor_taxa)
#' pheat_annotate_cols(ph, vendor_samples)
NULL

#' @rdname pheat_annotate
#' @export
pheat_annotate_rows <- function (ph, annotation, rownames_in = 1) {
  annotation <- make_rownames(annotation, rownames_in)
  ph$annotation_row <- annotation
  ph
}

#' @rdname pheat_annotate
#' @export
pheat_annotate_cols <- function (ph, annotation, rownames_in = 1) {
  annotation <- make_rownames(annotation, rownames_in)
  ph$annotation_col <- annotation
  ph
}
