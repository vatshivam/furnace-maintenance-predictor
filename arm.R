# install.packages('arules')
library(arules)
library(stringr)
library(arulesViz)
# df = read.csv('C:/Users/vatss/codes/furnace-maintenance-predictor/data/transactions_3.csv')
data=read.transactions("C:/Users/vatss/codes/furnace-maintenance-predictor/data/transactions_3.csv",rm.duplicates=FALSE,format="basket",sep=",",cols=1)
inspect(data)



rules = apriori(data,parameter = list(support=0.03,confidence=0.5,minlen=2))

inspect(rules)

## Plot of which items are most frequent
itemFrequencyPlot(data, topN=20, type="absolute")

## Sort rules by a measure such as conf, sup, or lift
SortedRules <- sort(rules, by="lift", decreasing=TRUE)
inspect(SortedRules)
(summary(SortedRules))


## Visualize
## tcltk

subrulesK <- head(sort(SortedRules, by="lift"),10)
plot(subrulesK)

plot(subrulesK, method="graph", engine="interactive")

## Visualize
## tcltk

subrules <- head(sort(SortedRules, by="lift"),15)
plot(subrules)

plot(subrules, method="graph", engine="interactive")
plot(subrules, method="graph", engine="htmlwidget")

