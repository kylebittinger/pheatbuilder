% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/util.R
\name{factor_gaps}
\alias{factor_gaps}
\title{Collect gap locations from factor}
\usage{
factor_gaps(x)
}
\arguments{
\item{x}{Factor or character vector. Gap locations are produced wherever the
value of \code{x} changes}
}
\value{
A numeric vector of gap locations, suitable for the \code{gaps}
  argument of \code{pheat_display_rows} or \code{pheat_display_cols}
}
\description{
Collect gap locations from factor
}
