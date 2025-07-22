#' Plots the most frequently used words in a given text using word_freq()
#'
#' This function uses word_freq() function to calculate the word frequencies, then
#' displays the top N words in a bar plot.
#'
#' @param text A string representing the input text.
#' @param top_n Number of top words to display (default = 10).
#' @param exclude Optional. A character vector of words that should be excluded from the result.
#' @return A ggplot2 plot.
#' @examples
#' plot_top_words("This is a beautiful day. A day where you can do a lot and just relax.", top_n = 5)
#' @export
plot_top_words <- function(text, top_n = 10, exclude = NULL){
  freq <- word_freq(text, exclude)
  top_words <- sort(freq, decreasing = TRUE)[1:min(top_n, length(freq))]
  df <- data.frame(word = names(top_words), count = as.numeric(top_words))

  # Plot for top_n
  library(ggplot2)
  plot <- ggplot(df, aes(x = reorder(word, count), y = count))+
    geom_bar(stat = "identity", fill = "darkgreen")+
    labs(title = paste("Top",min(top_n, length(freq)),"Word Frequencies"),
         x = "Word",
         y = "Count of word usage")+
    theme_minimal()

  return(plot)
}
