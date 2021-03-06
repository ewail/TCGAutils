% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/curatedTCGAData-helpers.R
\name{curatedTCGAData-helpers}
\alias{curatedTCGAData-helpers}
\alias{getSubtypeMap}
\alias{getClinicalNames}
\alias{splitAssays}
\alias{sampleTables}
\title{Helper functions for managing MultiAssayExperiment from
curatedTCGAData}
\usage{
getSubtypeMap(multiassayexperiment)

getClinicalNames(diseaseCode)

splitAssays(multiassayexperiment, sampleCodes = c("01", "11"))

sampleTables(multiassayexperiment, vial = FALSE)
}
\arguments{
\item{multiassayexperiment}{A \linkS4class{MultiAssayExperiment} object}

\item{diseaseCode}{A TCGA cancer code (e.g., "BRCA")}

\item{sampleCodes}{A string of sample type codes
(refer to \code{data(sampleTypes)}; default "01", "11")}

\item{vial}{(logical default FALSE) whether to display vials in the
table output}
}
\value{
\itemize{
    \item{getSubtypeMap}: A \code{data.frame} with columns representing
    actual data variables and explanatory names
    \item{getClinicalNames}: A \code{vector} of names that correspond to
    a particular disease code.
}
}
\description{
Additional helper functions for cleaning and uncovering metadata
within a downloaded \code{MultiAssayExperiment} from \code{curatedTCGAData}.
The \code{getSubtypeMap} function provides a 2 column \code{data.frame}
with in-data variable names and an interpreted names. The
\code{getClinicalNames} function provides a vector of variable names that
exist in the \code{colData} slot of a downloaded \code{MultiAssayExperiment}
object. These variables are obtained from
\link[RTCGAToolbox]{getFirehoseData} by default and tend to be present
across most cancer codes.
}
\section{splitAssays}{

    Separates samples by indicated sample codes into different assays
    in a \code{MultiAssayExperiment}. Refer to the \code{sampleTypes}
    data object for a list of available codes. This operation generates
    \strong{n} times the number of assays based on the number of sample codes
    entered. By default, primary solid tumors ("01") and solid tissue
    normals ("11") are seperated out.
}

\section{sampleTables}{

    Display all the available samples in each of the assays
}

\examples{
\dontrun{
library(curatedTCGAData)

coad <- curatedTCGAData(diseaseCode = "COAD",
    assays = "CNA*", dry.run = FALSE)
getSubtypeMap(coad)
}

getClinicalNames("COAD")

}
