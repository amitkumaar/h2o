\name{h2o.init}
\alias{h2o.init}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Connect to H2O and Install R Package
}
\description{
Connects to a running H2O instance and checks the local H2O R package is the correct version (i.e. that the version of the R package and the version of H2O are the same).
}
\usage{
h2o.init(ip = "localhost", port = 54321, startH2O = TRUE, silentUpgrade = FALSE, promptUpgrade = TRUE, Xmx = "2g")
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ip}{
Object of class \code{"character"} representing the IP address of the server where H2O is running.
}
  \item{port}{
Object of class \code{"numeric"} representing the port number of the H2O server.
}
  \item{startH2O}{
(Optional) A logical value indicating whether to start the H2O launcher GUI if no connection with H2O is detected. This is only possible if H2O was installed from the InstallBuilder executable and \code{ip = "localhost"} or \code{ip = "127.0.0.1"}.
}
  \item{silentUpgrade}{
(Optional) A logical value indicating whether to automatically install the H2O R package from the H2O server if a version mismatch is detected.
}
  \item{promptUpgrade}{
(Optional) A logical value indicating whether to prompt the user to install the H2O R package from the H2O server if a version mismatch is detected. Ignored when \code{silentUpgrade = TRUE}.
}
  \item{Xmx}{
(Optional) A string specifying the maximum size, in bytes, of the memory allocation pool to H2O. This value must a multiple of 1024 greater than 2MB. Append the letter m or M to indicate megabytes, or g or G to indicate gigabytes. 
  }
}
\details{
This method first checks if H2O is connectable. If it cannot connect and \code{startH2O = TRUE} with IP of localhost, it will attempt to start an instance of H2O with IP=localhost, port=54321. Otherwise, it stops immediately with an error. Once connected, the method checks to see if the local H2O R package version matches the version of H2O running on the server. If there is a mismatch and the user indicates she wishes to upgrade, it will remove the local H2O R package and download/install the H2O R package from the server.
}
\value{
Once the package is successfully installed, this method will load it and return a \code{H2OClient} object containing the IP address and port number of the H2O server. See the \href{http://docs.0xdata.com/userguide/topR.html}{H2O R package documentation} for more details, or type \code{??h2o}.
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
# Users may wish to manually upgrade their package (rather than waiting until being prompted), which requires that they 
#fully uninstall and reinstall the H2O package, and the H2O client package. You must unload packages running in 
the environment before upgrading. It's reccomended that users restart R or R studio after upgrading. 
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Try to create a localhost connection to H2O. 
localH2O = h2o.init()
localH2O = h2o.init(ip = "localhost", port = 54321)

# Prompt to install H2O R package from server if version mismatch (indicated by silentUpgrade and promptUpgrade)
localH2O = h2o.init(ip = "localhost", port = 54321, silentUpgrade = FALSE, promptUpgrade = TRUE)

# Automatically install H2O R package from server if version mismatch
localH2O = h2o.init(ip = "localhost", port = 54321, startH2O = FALSE, silentUpgrade = TRUE, promptUpgrade = FALSE)

# Uninstall and maunually upgrade H2O for R (after unloading)
detach("package:h2oRClient", unload=TRUE)
detach("package:h2o", unload=TRUE)
remove.packages("h2oRClient")
remove.packages("h2o")
install.packages("~/Work/h2o/target/R/h2o_2.1.0.99999.tar.gz", repos = NULL, type = "source")
library(h2o)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
