#' Create a arithmetic table in Z_n space
#'
#' @param z The ring size.
#' @param FUN The binary function to be applied.
#' @export
m_table <- function(z, FUN = '*') {
  z_seq <- seq_len(z - 1)
  structure(
    outer(z_seq, z_seq, FUN) %% z,
    dimnames= list(z_seq, z_seq),
    FUN = FUN,
    class = "m_table"
  )
}

#' @export
print.m_table <- function(x, ...) {
  pad <- 3L
  m <- max(x)
  while ({m <- m / 10} > 1)
    pad <- pad + 1L
  d <- nrow(x)
  f <- function(s) formatC(s, width = pad)
  cat(
    f(attr(x, "FUN")), " |", f(seq_len(d)), "\n",
    rep("-", pad), "-+", rep("-", pad * d), "\n",
    sep = ""
    )
  lapply(seq_len(d), function(i) cat(f(i), " |", f(x[i,]), "\n", sep = ""))
  invisible(x)
}

#' Function factory for doing modular arithmetic
#'
#' @param z The ring size.
#' @export
m_arithmetic <- function(z) {
  mtable <- m_table(z)
  list(
    identity = function(a) a %% z,
    add = function(a, b) (a + b) %% z,
    sub = function(a, b) (a - b) %% z,
    mul = function(a, b) (a * b) %% z,
    div = function(a, b) as.vector(which(a == mtable[,b])),
    tables = list(
      add = m_table(z, '+'),
      mul = mtable
    )
  )
}
