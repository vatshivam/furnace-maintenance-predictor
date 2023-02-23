# install.packages('arules')
library(arules)
library(stringr)
df = read.csv('C:/Users/vatss/codes/furnace-maintenance-predictor/data/transactions_2.csv')
data=read.transactions("C:/Users/vatss/codes/furnace-maintenance-predictor/data/transactions_2.csv",rm.duplicates=FALSE,format="basket",sep=",",cols=1)
inspect(data)

rules = apriori(data,parameter = list(support=0.10,confidence=0.00,minlen=0))

inspect(rules)

# strings to search for
a = "aluminium"
b = "china"

# counting the occurrences of character
support_count_a =0 
support_count_b =0

for(i in 1:nrow(df)){

  if (a %in% unlist(strsplit(df[i, "transactions"],","))){
    support_count_a = support_count_a+1
  }
  if (b %in% unlist(strsplit(df[i, "transactions"],","))){
    support_count_b = support_count_b+1
  }
}
  
# counting occurrences of 2 strings (for confidence and lift)
support_count_ab = 0
for(i in 1:nrow(df)){
  if ((a %in% unlist(strsplit(df[i, "transactions"],","))) &(b %in% unlist(strsplit(df[i, "transactions"],","))) ){
    support_count_ab = support_count_ab+1
  }
}

support_a = support_count_a/nrow(df)
support_b = support_count_b/nrow(df)

support_ab = support_count_ab/nrow(df)

confidence = support_ab/support_a

lift = support_ab/(support_a * support_b)

cat(support_a,confidence,lift)
