\name{bisg_prep_race_predict}
\alias{bisg_prep_race_predict}

\title{Bayesian Improved Surname Geocoding Data Preparation and Race Prediction
}
\description{Preps data for BISG estimation via WRU package
  
}
\usage{bisg_prep_race_predict(df, voterid=NULL, precinct=NULL, surname_char, state,
                                   census.geo="block", census.key, census.data, 
                                   census.surname = TRUE, surname.only = FALSE,
                                   surname.year = 2010, age = FALSE, sex = FALSE, 
                                   party, retry = 0)
  
}

\arguments{
  \item{df}{data.frame() object, containing voter file information with FIPS code information extracted using unit_comb_extract() function, which brings in relevant columns}
  \item{voterid}{String of voterid column name. Default = NULL. Probably want this.}
  \item{precinct}{String of precinct column name. Default = NULL. Probably want this.}
  \item{surname_char}{String of surname_char column name. This column is passed to wru package.}
  \item{state}{String of two digit state abbreviation, e.g., "NY", or "CA".}
  \item{census.geo}{String of geographic level used for BISG. Default is Census "block". An optional character vector specifying what level of geography to use to merge in U.S. Census 2010 geographic data. Currently "county", "tract", "block", and "place" are supported. Note: sufficient information must be in user-defined voter.file object. If census.geo = "county", then voter.file must have column named county. If census.geo = "tract", then voter.file must have columns named county and tract. And if census.geo = "block", then voter.file must have columns named county, tract, and block. If census.geo = "place", then voter.file must have column named place. Specifying census.geo will call census_helper function to merge Census geographic data at specified level of geography.}
  \item{census.key}{A character object specifying user's Census API key. Required if census.geo is specified, because a valid Census API key is required to download Census geographic data.}
  \item{census.data}{A list indexed by two-letter state abbreviations, which contains pre-saved Census geographic data. Can be generated using get_census_data function from wru package.}
  \item{census.surname}{A TRUE/FALSE object. If TRUE, function will call merge_surnames to merge in Pr(Race | Surname) from U.S. Census Surname List (2000 or 2010) and Spanish Surname List. If FALSE, voter.file object must contain additional fields specifying Pr(Race | Surname), named as follows: p_whi for Whites, p_bla for Blacks, p_his for Hispanics/Latinos, p_asi for Asians, and/or p_oth for Other. Default is TRUE.}
  \item{surname.only}{A TRUE/FALSE object. If TRUE, race predictions will only use surname data and calculate Pr(Race | Surnname). Default is FALSE.}
  \item{surname.year}{A number to specify the year of the census surname statistics. These surname statistics is stored in the data, and will be automatically loaded. The default value is 2010, which means the surname statistics from the 2010 census will be used. Currently, the other available choice is 2000.}
  \item{age}{An optional TRUE/FALSE object specifying whether to condition race predictions on age (in addition to surname and geolocation). Default is FALSE. Must be same as age in census.data object. May only be set to TRUE if census.geo option is specified. If TRUE, voter.file should include a numerical variable age.}
  \item{sex}{optional TRUE/FALSE object specifying whether to condition race predictions on sex (in addition to surname and geolocation). Default is FALSE. Must be same as sex in census.data object. May only be set to TRUE if census.geo option is specified. If TRUE, voter.file should include a numerical variable sex, where sex is coded as 0 for males and 1 for females.}
  \item{party}{An optional character object specifying party registration field in voter.file, e.g., party = "PartyReg". If specified, race/ethnicity predictions will be conditioned on individual's party registration (in addition to geolocation). Whatever the name of the party registration field in voter.file, it should be coded as 1 for Democrat, 2 for Republican, and 0 for Other.}
  \item{retry}{The number of retries at the census website if network interruption occurs. Default = 0.}
}

\value{List object of of two data.frames. List item 1 is initial voter file data.frame. List object 2 (named bisg) includes race predictions.
  
}
\references{
  wru R package. Kabir Khanna, Kosuke Imai, Hubert Jin. 
  Imai and Khanna (2015) "Improving Ecological Inference by Predicting Individual   Ethnicity from Voter Registration Records" <DOI:10.1093/pan/mpw001>
}
\author{
  Loren Collingwood <loren.collingwood@ucr.edu>
}

\examples{
  
  # EXAMPLE: NOT RUN #
  # NOTE: You need to have a census key to run this #
  
  data(ny_voter)
  head(ny_voter)
  
  # Load ny_census object #
  # load ( system.file("extdata/ny_census.RData",package="eiCompare") )
  
  # Now load your Census key #
  # [add in here where you would do that]
  # key_census = ""

  ####################################################
  # Prep Data & Perform Bayesian Surname Geolocation #
  ####################################################
  # Extract second list object (called bisg, note $bisg)
  #bisg <- bisg_prep_race_predict(df=ny_voter,
  #                     voterid = "Voter.ID",
  #                     precinct = "SD..Poll",
  #                     surname_char = "Last.Name",
  #                     state = "NY",
  #                     census.key = key_census,
  #                     census.data = ny_census)$bisg

  
}
