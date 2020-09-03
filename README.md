
<!-- README.md is generated from README.Rmd. Please edit that file -->

# modulR

<!-- badges: start -->

<!-- badges: end -->

This R package helps do modular arithmetic operations. In particular, it
can give arithmetic (multiplication) tables in modular space.

It is a demo package meant to show some strategies for creating packages
and illustrates some basic S3 classes in R. It is not meant for
production use. A better package for doing modular arithmetic in R would
be the [gmp](https://cran.r-project.org/package=gmp) package (or base
R\!).

## Installation

``` r
remotes::install_github("pegeler/modulR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(modulR)

# Initialize
z11 <- m_arithmetic(11)
z11
#> A modulR object, modulus 11

# What is 13 in Z_11?
z11$identity(13)
#> [1] 2

# Multiplication table in Z_11
z11$tables$mul
#>   * |  1  2  3  4  5  6  7  8  9 10
#> ----+------------------------------
#>   1 |  1  2  3  4  5  6  7  8  9 10
#>   2 |  2  4  6  8 10  1  3  5  7  9
#>   3 |  3  6  9  1  4  7 10  2  5  8
#>   4 |  4  8  1  5  9  2  6 10  3  7
#>   5 |  5 10  4  9  3  8  2  7  1  6
#>   6 |  6  1  7  2  8  3  9  4 10  5
#>   7 |  7  3 10  6  2  9  5  1  8  4
#>   8 |  8  5  2 10  7  4  1  9  6  3
#>   9 |  9  7  5  3  1 10  8  6  4  2
#>  10 | 10  9  8  7  6  5  4  3  2  1
```
