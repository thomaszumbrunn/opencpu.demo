#' Test opencpu plotting
#'
#' The purpose of this function is to test if opencpu is correctly capturing different types of plots.
#' @return should return NULL and exactly 6 plots.
#' @author Jeroen Ooms
#' @export
#' @examples testplothandlers(); #should generate six plots
#' # Equivalent to:
#' # http://beta1.opencpu.org/R/call/opencpu.demo/testplothandlers/save

testplothandlers <- function(){
	#this function should print exactly 6 plots
	
	#two regular plots
	print(plot(cars));
	print(plot(iris));
	
	#two ggplots
	library(ggplot2);
	print(qplot(x=speed, y=dist,data=cars));
	print(qplot(x=speed, y=dist,data=cars, geom="smooth"));	
	
	#simple lattice plot
	library(lattice);	
	print(histogram(cars$speed));
	
	#complicated lattice plot (form manual)
	Depth <- equal.count(quakes$depth, number=8, overlap=.1)
	print(xyplot(lat ~ long | Depth, data = quakes));
	update(trellis.last.object(),
			strip = strip.custom(strip.names = TRUE, strip.levels = TRUE),
			par.strip.text = list(cex = 0.75),
			aspect = "iso")
	
	#don't return anything
	return(NULL);
}
