% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Valiation.R
\name{survAnalysis}
\alias{survAnalysis}
\title{Survival analysis(Survival curves, Log-rank test) and compute Silhouette information for cancer subtypes}
\usage{
survAnalysis(mainTitle = "Survival Analysis", time, status, group,
  distanceMatrix = NULL, similarity = TRUE)
}
\arguments{
\item{mainTitle}{A character will display in the result plot.}

\item{time}{A numeric vector representing the survival time (days) of a set of samples.}

\item{status}{A numeric vector representing the survival status of a set of samples. 0=alive/censored, 1=dead.}

\item{group}{A vector represent the cluster label for a set of samples.}

\item{distanceMatrix}{A data matrix represents the similarity matrix or dissimilarity matrix between samples.\cr
If NULL, it will not compute silhouette width and draw the plot.}

\item{similarity}{A logical value. If TRUE, the distanceMatrix is a similarity distance matrix between samples. Otherwise a dissimilarity distance matrix between samples}
}
\value{
The log-rank test p-value
}
\description{
Survival analysis is a very common tool to explain and validate the cancer subtype identification result. It provides the significance testing and 
graphical display for the verification of the survival patterns between the identified cancer subtypes.
}
\examples{
### SNF result analysis
data(GeneExp)
data(miRNAExp)
data(time)
data(status)
data1=FSbyCox(GeneExp,time,status,cutoff=0.05)
data2=FSbyCox(miRNAExp,time,status,cutoff=0.05)
GBM=list(GeneExp=data1,miRNAExp=data2)
result=ExecuteSNF(GBM, clusterNum=3, K=20, alpha=0.5, t=20)
group=result$group
distanceMatrix=result$distanceMatrix
p_value=survAnalysis(mainTitle="GBM",time,status,group,
                     distanceMatrix=distanceMatrix,similarity=TRUE)
}
\author{
Xu,Taosheng \email{taosheng.x@gmail.com},Thuc Le \email{Thuc.Le@unisa.edu.au}
}

