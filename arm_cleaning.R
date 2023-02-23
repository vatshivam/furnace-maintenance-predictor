library(ggplot2)
setwd('C:/Users/vatss/codes/furnace-maintenance-predictor')
df = read_csv('data/transactions.csv')
head(df)

# data = list()
for(i in 1:nrow(df)) {       # for-loop over rows
  df[i, "transactions"] = str_replace(df[i, "transactions"],fixed(',,'),fixed(','))
  df[i, "transactions"] = str_replace(df[i, "transactions"],fixed("'s"),fixed(''))

}

write.csv(df, "C:/Users/vatss/codes/furnace-maintenance-predictor/data/transactions_2.csv", row.names=FALSE)
