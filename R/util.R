#' Collect gap locations from factor
#' @param x Factor or character vector. Gap locations are produced wherever the
#'   value of \code{x} changes
#' @return A numeric vector of gap locations, suitable for the \code{gaps}
#'   argument of \code{pheat_display_rows} or \code{pheat_display_cols}
#' @export
factor_gaps <- function (x) {
  x <- as.character(x)
  x_len <- rle(x)$lengths
  cumsum(x_len) %>% head(n=-1)
}

#' Create a named color palette for a factor
#' @param x A factor or character vector to use for the levels
#' @param colors A vector of colors
#' @param ... Here, the user can provide numeric index values for colors that
#'   should be used first, second, third, and so on in the palette. This allows
#'   for the colors to be rearranged if they are not quite cutting it in the
#'   default order.
#' @return A named vector of colors corresponding to the factor.
#' @export
#' @details This function may be most useful in conjunction with \code{dput()},
#'   which will print out the code for the resultant palette. This way, color
#'   palettes can be hard-coded into scripts, which will preserve the color
#'   scheme even if the levels of the factor were to change in the future.
factor_palette <- function (x, colors, ...) {
  x_levels <- levels(as.factor(x))
  first_colors <- as.integer(c(...))

  first_colors_out_of_range <- first_colors > length(colors)
  if (any(first_colors_out_of_range)) {
    stop(
      "Color index out of range: ",
      first_colors[first_colors_out_of_range],
      ". Vector of colors has ", length(colors), " elements.")
  }

  last_colors <- setdiff(seq_along(colors), first_colors)
  color_idx <- c(first_colors, last_colors)
  palette <- colors[color_idx]
  palette <- palette[seq_along(x_levels)]
  names(palette) <- x_levels
  palette
}

# Convert a column into rownames
make_rownames <- function (df, rownames_in = 1) {
  if (!is.null(rownames_in)) {
    if (length(rownames_in) != 1) {
      stop("rownames_in must have length 1")
    }
    if (is.character(rownames_in)) {
      rownames_in <- match(rownames_in, colnames(df))
    }
    df <- as.data.frame(df)
    df_rownames <- df[,rownames_in]
    df <- df[,-rownames_in, drop = FALSE]
    rownames(df) <- df_rownames
  }
  df
}

# Check that value is not NA of length one
not_scalar_na <- function (val) {
  !((length(val) == 1) && is.na(val))
}
