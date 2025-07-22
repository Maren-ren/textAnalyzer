#' Analyzes the sentence structure of a given text
#'
#' This function splits the input text into individual sentence and calculates the number of
#' sentences, as well some basic statistic on the count of words per sentence, specifically the avg, min and max.
#'
#' @param text A string representing the input text.
#' @return A named list containing:
#' \describe{
#'   \item{n_sentences}{Total number of sentences in the input text.}
#'   \item{avg_sentence_word_count}{Average number of words per sentence.}
#'   \item{min_sentence_word_count}{Fewest words found in any sentence.}
#'   \item{max_sentence_word_count}{Most words found in any sentence.}
#' }
#' @examples
#' sentence_stats("A simple sentence. A few sentences, to test! That is what this is.")
#' @export
sentence_stats <- function(text){
  # Split text into sentences
  sentences <- unlist(strsplit(text, "(?<=[.!?])\\s+", perl = TRUE))
  count_words <- numeric(length(sentences))

  #Count words per sentence
  for (i in seq_along(sentences)){
    words <- unlist(strsplit(sentences[i], "[^A-Za-z0-9']+"))
    words <- words[words != ""]
    count_words[i] <- length(words)
  }

  # Return some basic stats
  result <- list(
    n_sentences = length(sentences),
    avg_sentence_word_count = round(mean(count_words), 2),
    min_sentence_word_count = min(count_words),
    max_sentence_word_count = max(count_words)
  )

  return(result)
}

