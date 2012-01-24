#' Plot live stock data.
#' 
#' The following function is described on http://opencpu.org/2011/08/embedding-a-plot-in-your-website/.
#' 
#' @param ticker a ticker name for a plot. For example "GOOG" or "YHOO"
#' @return returns NULL and prints a plot
#' @author Jeroen Ooms
#' @export
#' @examples 
#' \dontrun{
#'   liveplot("GOOG")
#' # Is equivalent to e.g:
#' # http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/png?ticker="GOOG"
#' # http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/pdf?ticker="GOOG"
#' # http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/png?ticker="YHOO"
#' # http://beta1.opencpu.org/R/call/opencpu.demo/liveplot/png?ticker="YHOO"&!width=1000&!height=800
#' }

liveplot <- function (ticker) 
{
	url <- paste("http://ichart.finance.yahoo.com/table.csv?s=", 
			ticker, "&a=07&b=19&c=2004&d=07&e=13&f=2015&g=d&ignore=.csv", 
			sep = "")
	mydata <- read.csv(url)
	mydata$Date <- as.Date(mydata$Date)
	myplot <- ggplot2::qplot(Date, Close, data = mydata, geom = c("line", 
					"smooth"), main = ticker)
	print(myplot)
	return(NULL);
}
