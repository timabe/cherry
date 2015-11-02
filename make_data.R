#create some scenarios

lump_params <- expand.grid(
  lumps = seq(300000, 600000, by = 50000),
  returns = seq(0.05, 0.12, by = .01)
)


lump_outcomes <- mapply(lump_payment, lump =  lump_params$lumps, yrr = lump_params$returns)

month_params <- expand.grid(
  rents = seq(2000,3500, by = 500),
  returns = seq(0.05, 0.12, by = .01),
  rent_incr = seq(0,0.05, by = .01)
)
month_outcomes <- mapply(monthly_payments, 
                         sr = month_params$rents, 
                         yrr = month_params$returns, 
                         iry = month_params$rent_incr)


# you can look up the income growth by the various params
# the row number of the df corresponds to the column of the matrix