#' Make a function
#' 
#' This does nothing else than verifying that an object is a function, and remove any custom environment.
#' 
#' @param myfun a function
#' @return the same function
#' @author Jeroen Ooms
#' @export
makefunction <- function(myfun){

	if(!is.function(myfun)){
		stop("code is not a function.")
	}
	
	#we don't care about the environment
	environment(myfun) <- globalenv();
	return(myfun);
}
