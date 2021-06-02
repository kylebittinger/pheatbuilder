#' Add cluster dendrograms to heatmap
#'
#' @param ph Heatmap of class "pheat"
#' @param distance Distance measure, as listed for \code{dist}
#' @param method Clustering method, passed to \code{hclust}
#' @param custom Custom \code{hclust} object for clustering
#' @return A modified heatmap of class "pheat"
#' @name pheat_cluster
#' @examples
#' ph <- pheat(vendor_props)
#' pheat_cluster_rows(ph)
#' pheat_cluster_cols(ph)
NULL

#' @rdname pheat_cluster
#' @export
pheat_cluster_rows <- function (ph,
                                distance = "euclidean",
                                method = "complete",
                                custom = NULL) {
  if (is.null(custom)) {
    ph$cluster_rows <- TRUE
    ph$clustering_distance_rows <- distance
    ph$clustering_method <- method
  } else {
    ph$cluster_rows <- custom
  }
  ph
}

#' @rdname pheat_cluster
#' @export
pheat_cluster_cols <- function (obj,
                                distance = "euclidean",
                                method = "complete",
                                custom = NULL) {
  if (is.null(custom)) {
    obj$cluster_cols <- TRUE
    obj$clustering_distance_cols <- distance
    obj$clustering_method <- method
  } else {
    obj$cluster_cols <- custom
  }
  obj
}
