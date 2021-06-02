#' Heatmap color scale
#'
#' @param ph Heatmap of class "pheat"
#' @param color Color palette for hetamap
#' @param breaks Breakpoints between colors in the heatmap. Should be a numeric
#'   vector that is one element longer than the color palette
#' @param na_color Color for \code{NA} values in the heatmap
#' @return A modified heatmap of class "pheat"
#' @export
pheat_color <- function (ph,
                         color = NA,
                         breaks = NA,
                         na_color = "#DDDDDD") {
  if (not_scalar_na(color) && not_scalar_na(breaks)) {
    if (length(breaks) != (length(color) + 1)) {
      warning("Length of breaks is not length of colors + 1.")
    }
  }
  if (not_scalar_na(color)) {
    ph$color <- color
  }
  ph$breaks <- breaks
  ph$na_col <- na_color
  ph
}

pheat_annotation_color <- function (ph, ...) {
  ph$annotation_colors <- list(...)
  ph
}
