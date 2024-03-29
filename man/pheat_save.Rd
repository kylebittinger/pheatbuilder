% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/output.R
\name{pheat_save}
\alias{pheat_save}
\title{Save the heatmap to a file}
\usage{
pheat_save(ph, filename = "heatmap.pdf", width = NA, height = NA)
}
\arguments{
\item{ph}{Heatmap of class "pheat"}

\item{filename}{File where the heatmap will be saved}

\item{width}{Width of the figure}

\item{height}{Height of the figure}
}
\value{
The original heatmap, invisibly. This allows the user to save the
  heatmap and print to the screen by calling \code{print.pheat} on the
  output of this function.
}
\description{
Save the heatmap to a file
}
