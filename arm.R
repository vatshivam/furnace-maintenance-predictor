# install.packages('arules')
library(arules)
library(stringr)
library(arulesViz)

data=read.transactions("C:/Users/vatss/codes/furnace-maintenance-predictor/data/transactions_3.csv",rm.duplicates=FALSE,format="basket",sep=",",cols=1)
inspect(data)

rules = apriori(data,parameter = list(support=0.03,confidence=0.5,minlen=2))

inspect(rules)

## Plot of which items are most frequent
itemFrequencyPlot(data, topN=15, type="absolute")

## Sort rules by a measure such as conf, sup, or lift
SortedRules <- head(sort(rules, by="lift", decreasing=TRUE),30)
inspect(SortedRules)
(summary(SortedRules))


## Visualize
## tcltk

subrulesK <- head(sort(SortedRules, by="lift"),20)
plot(subrulesK)

plot(subrulesK, method="graph", engine="interactive")

## Visualize
## tcltk

subrules <- head(sort(SortedRules, by="lift"),15)
plot(subrules)

plot(rules, method="graph", engine="interactive")
plot(rules, method="graph", engine="htmlwidget")

