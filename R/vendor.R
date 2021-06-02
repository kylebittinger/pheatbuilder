#' Microbiome of mouse cecum and feces
#'
#' Mice were purchased from four different vendors. Samples from the cecum and
#' feces were submitted for 16S rRNA marker gene sequencing to profile the
#' bacterial communities.
#'
#' @format The data matrix \code{vendor_props} contains the bacterial taxon
#'   proportions in each sample. Only taxa with >1\% mean relative abundance
#'   were kept in the matrix.
"vendor_props"

#' @rdname vendor_props
#' @format The associated data frame \code{vendor_taxa} describes the taxa that
#'   comprise the rows of \code{vendor_props}:
#'   \describe{
#'     \item{taxon}{The taxon represented in the data matrix.}
#'     \item{phylum}{The phylum of the taxon.}
#'   }
"vendor_taxa"

#' @rdname vendor_props
#' @format The associated data frame \code{vendor_samples} describes the
#'   samples comprising the columns of \code{vendor_props}:
#'   \describe{
#'     \item{sample_id}{The sample represented in the data matrix.}
#'     \item{sample_type}{The type of sample, either Cecum or Feces.}
#'     \item{vendor}{The vendor from which the mouse was purchased.}
#'   }
"vendor_samples"
