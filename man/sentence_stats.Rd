% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sentence_stats.R
\name{sentence_stats}
\alias{sentence_stats}
\title{Analyzes the sentence structure of a given text}
\usage{
sentence_stats(text)
}
\arguments{
\item{text}{A string representing the input text.}
}
\value{
A named list containing:
\describe{
  \item{n_sentences}{Total number of sentences in the input text.}
  \item{avg_sentence_word_count}{Average number of words per sentence.}
  \item{min_sentence_word_count}{Fewest words found in any sentence.}
  \item{max_sentence_word_count}{Most words found in any sentence.}
}
}
\description{
This function splits the input text into individual sentence and calculates the number of
sentences, as well some basic statistic on the count of words per sentence, specifically the avg, min and max.
}
\examples{
sentence_stats("A simple sentence. A few sentences, to test! That is what this is.")
}
