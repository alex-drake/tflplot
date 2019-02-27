## tflplot

This repo is inspired by the excellent [BBC bbplot](https://github.com/bbc/bbplot/) package, and aims to provide helpful functions to produce graphics made using `ggplot2` with colours used by Transport for London (TfL). These colours used in this package can be found in the [TfL Digital Design Guide](http://content.tfl.gov.uk/design-style-guide.pdf). *Please note that this is not endorsed by Transport for London and is a personal project to learn how to create packages in R.*

## Installation

This package is not available on CRAN and as such must be installed using the `devtools` package.

```
devtools::install_github('alex-drake/tflplot')
```

## To Do

* Select first n colours in palette rather than interpolate
* Option to merge palettes (modes and underground?) to use unique colours
* Option to interpolate specific colours (eg tfl primary)
* Add Overground to colour palette
* Add Elizabeth Line to colour palette
