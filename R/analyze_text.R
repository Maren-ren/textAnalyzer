#' Summarizes features from a given text
#'
#' This function combines word and sentence metrics into one overview.
#' It uses the function: word_freq, sentence_stats and plot_top_words.
#' The function returns the count of words and total unique words in the text,
#' the most frequently used word and how often, the plot of the top used word and
#' total sentences, avg, min and max word count per sentence.
#'
#' @param text A string representing the input text.
#' @param top_n Number of top words to display (default = 5).
#' @param exclude Optional. A character vector of words that should be excluded from the result.
#' @return A named list containing:
#' \describe{
#'    \item{total_words}{Total number of words (excluding any excluded).}
#'    \item{unique_words}{Count of unique words in the text.}
#'    \item{most_frequent_word}{The most frequently used word.}
#'    \item{most_frequent_count}{How often the most frequently used word appears.}
#'    \item{top_words_plot}{A ggplot2 bar plot with the top N most used words.}
#'    \item{n_sentences}{Total number of sentences in the input text.}
#'    \item{avg_sentence_word_count}{Average number of words per sentence.}
#'    \item{min_sentence_word_count}{Fewest words found in any sentence.}
#'    \item{max_sentence_word_count}{Most words found in any sentence.}
#' }
#' @examples
#' analyze_text("It is a beautiful day. Just coding and relaxing. What a beautiful day. And still much todo. Some, some, repetitions for some fun.", top_n = 3)
#' @export
analyze_text <- function(text, top_n = 5, exclude = NULL){
  freq <- word_freq(text, exclude)
  sentences_stat <- sentence_stats(text)

  summary <- list(
    total_words = sum(freq),
    unique_words = length(freq),
    most_frequent_word = paste(names(freq)[freq == max(freq)]),
    most_frequent_count = max(freq),
    top_words_plot = plot_top_words(text, top_n, exclude),
    n_sentences = sentences_stat$n_sentences,
    avg_sentence_word_count = sentences_stat$avg_sentence_word_count,
    min_sentence_word_count = sentences_stat$min_sentence_word_count,
    max_sentence_word_count = sentences_stat$max_sentence_word_count
  )

  return(summary)
}
