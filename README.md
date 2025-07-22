# textAnalyzer

textAnalyzer is an R package designed to analyze written text, including sentence metric, word frequency abakysus, and visualizing the most common words with clean ggplot2 plots.

## Features 
- 'word_freq()'
  - Calculates word frequency
  - Supports word exclusion
 
- 'plot_top_words()
  - Creates a bar plot of the most used words in the given text
  - Customizable with the top-N selection 
  - Supports word exclusion
 
- 'sentence_stats()'
  - Returns sentence statistics:
      - Total number of sentences
      - Average word count per sentence
      - Min/max word count per sentence

- 'analyze_text()'
  - Combiens all analysis function
  - Calculates total word count and unique word count
  - Identifies the most frequently used word
  - Returns a summary info and a visual plot of the top n used words
  - Supports word exclusion

## Installation
```r
remotes::install_github("Maren-Ren/textAnalyzer")
```

## Example

```r
library(textAnalyzer)

text <- "This package is interesting. It helps with analyzing written content with ease. Now you cant start!"

# Word frequency
word_freq(text, exclude = c("this"))

# Plots top N words
plot_top_words(text, top_n = 5)

# Get sentence statistics
sentence_stats(text)

# Run full text analysis
result <- analyze_text(text, top_n = 5, exclude = c("this"))

# Print some results
print(result$total_words)
print(result$unique_words)
print(result$n_sentences)

# Show visual plot
print(result$top_words_plot)

```

