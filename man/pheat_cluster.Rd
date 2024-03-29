% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cluster.R
\name{pheat_cluster}
\alias{pheat_cluster}
\alias{pheat_cluster_rows}
\alias{pheat_cluster_cols}
\title{Add cluster dendrograms to heatmap}
\usage{
pheat_cluster_rows(
  ph,
  distance = "euclidean",
  method = "complete",
  custom = NULL
)

pheat_cluster_cols(
  obj,
  distance = "euclidean",
  method = "complete",
  custom = NULL
)
}
\arguments{
\item{ph}{Heatmap of class "pheat"}

\item{distance}{Distance measure, as listed for \code{dist}}

\item{method}{Clustering method, passed to \code{hclust}}

\item{custom}{Custom \code{hclust} object for clustering}
}
\value{
A modified heatmap of class "pheat"
}
\description{
Add cluster dendrograms to heatmap
}
\examples{
ph <- pheat(vendor_props)
pheat_cluster_rows(ph)
pheat_cluster_cols(ph)
}
