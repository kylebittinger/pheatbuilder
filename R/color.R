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

saturated_rainbow <- function (n, saturation_limit = 0.4) {
  saturated_len <- floor(n * (1 - saturation_limit))
  unsaturated_len <- n - saturated_len
  unsaturated_colors <- rev(rainbow(unsaturated_len, start = 0, end = 0.6))
  last_color <- tail(unsaturated_colors, n = 1)
  saturated_colors <- rep(last_color, saturated_len)
  colors <- c(unsaturated_colors, saturated_colors)
  colors[1] <- "#FFFFFFFF"
  colors
}


#' Use a saturated rainbow color palette for the heatmap
#' @param saturation_limit The value after which the color stops changing
#' @param upper_limit The upper limit of the scale
#' @param na_color Color for \code{NA} values in the heatmap
#' @return A modified heatmap of class "pheat"
#' @export
pheat_color_saturated <- function (ph,
                                   saturation_limit = 0.4,
                                   upper_limit = 1.0,
                                   na_color = "#DDDDDD") {
  colors <- saturated_rainbow(101, saturation_limit = saturation_limit)
  breaks <- c(0, 1e-10, seq(0.01, 1, length.out = 100))
  pheat_color(ph, color = colors, breaks = breaks)
}

#' Set color palettes for heatmap annotations
#' @param ... Expects keyword arguments where the keyword is the column name
#'   for the annotation, and the value is a (named) character vector of colors
#' @return A modified heatmap of class "pheat"
#' @export
pheat_annotation_color <- function (ph, ...) {
  ph$annotation_colors <- list(...)
  ph
}
