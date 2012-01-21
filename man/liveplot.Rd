\name{liveplot}
\alias{liveplot}
\title{Plot live stock data.}
\usage{
  liveplot(ticker)
}
\arguments{
  \item{ticker}{a ticker name for a plot. For example
  "GOOG" or "YHOO"}
}
\value{
  returns NULL and prints a plot
}
\description{
  The following function is described on
  http://opencpu.org/2011/08/embedding-a-plot-in-your-website/.
}
\examples{
\dontrun{
  liveplot("GOOG")
# Is equivalent to e.g:
# http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/png?ticker="GOOG"
# http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/pdf?ticker="GOOG"
# http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/png?ticker="YHOO"
# http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/png?ticker="YHOO"&!width=1000&!height=800
}
}
\author{
  Jeroen Ooms
}

