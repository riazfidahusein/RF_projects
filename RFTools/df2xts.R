#' Convert data framw object to xts object
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
df2xts <- function(x){
  out <- xts(x[,-1], order.by=x[,1])
  
  return(out)
}
