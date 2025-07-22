#' Calculates frequencies of words in a text
#'
#' This function splits the input text into words, converts them to lowercase, optionally
#' removes user-defined words from the counting for frequency,
#' and returns their frequency order in descending order.
#'
#' @param text A string representing the input text.
#' @param exclude Optional. A character vector of words that should be excluded form the result.
#' @return A table of word frequencies, sorted in descending order.
#' @examples
#' word_freq("Today is a good day! A very good day.")
#' word_freq("We are having fun today, and we are outside today and we are going swimming.", exclude = c("are", "and"))
#' @export

word_freq <- function(text, exclude = NULL){
  words <- tolower(unlist(strsplit(text, "[^A-Za-z0-9']+")))
  words <- words[words != ""]

  if (!is.null(exclude)){
    words <- words[!(words %in% tolower(exclude))]
  }
  freq <- sort(table(words), decreasing = TRUE)
  return(freq)
}
