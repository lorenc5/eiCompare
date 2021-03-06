\name{race_check_2_3}
\alias{race_check_2_3}

\title{race_check_2_3}
\description{Checks that both sides of the RxC equation for White/Minority and 
  White, Black, Hispanic, Other, respectively, add up to the same values. 
  If small rounding issues, adjusts the "other" race category.
  
}
\usage{race_check_2_3(dat, split=c(3,4), catch=FALSE, catch_col=NULL, 
                      print_sides=TRUE)
  }

\arguments{
  \item{dat}{data.frame() object. One no vote/third party vote column, 
    with candidate votes (for either 2 or 3 candidates), then up to 
    four demographics with last as other}
  \item{split}{Numeric vector of length 2. Default is c(3,4), for two candidates and one catch-all. 
    c(4,5) for three candidates and one catch all.}
  \item{catch}{Logical (TRUE/FALSE). Catch negative values. Default is FALSE}
  \item{catch_col}{Column names to be catched.}
  \item{print_sides}{Logical (TRUE/FALSE). Print out evaluations. Default is TRUE}
}

\value{Dataset of Left side (Votes) vs. Right side (Demographics). diff column can be tagged on to exiting 'other' category 
  to expedite data preparation process.
}
\author{
  Loren Collingwood <loren.collingwood@ucr.edu>
}

\examples{
  
  # EXAMPLE: NOT RUN #
  
}
