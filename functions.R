# what would a stream of payments of x be worth over time?
# ### assumptions
# # yearly rate of return
# yrr <- 0.1
# # increase in rent yearly 
# iry <- 0
# # starting rent
# sr <- 2000
# years <- 35

monthly_payments <- function(sr = 2000, yrr = 0.1, iry = 0, years = 35) {
  out <- rep(NA, years)
  for (y in 1:years) {
    if (y == 1) {
      out[y] <- sr*12*(1+yrr) 
    } else {
      out[y] <- ( out[y-1] + sr*((1+iry)^y)*12 ) * (1 + yrr)
    }
  }
  return(out)
}

# lump_payment
# get 500000 in year1 and get the same yrr 
lump_payment <- function(lump = 500000, yrr = 0.1, years = 35) {
  out <- rep(NA, years)
  for (y in 1:years) {
    if (y == 1) {
      out[y] <- lump * (1 + yrr)
    } else {
      out[y] <- out[y-1] * (1 + yrr)
    }
  }
  return(out) 
}