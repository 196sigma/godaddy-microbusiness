rm(list=ls())
gc()

train <- read.csv("train-imputed.csv")
cfips <- unique(train$cfips)
cfip <- cfips[1]; print(cfip)
X <- train[which(train$cfips == cfip), ]
summary(train)
c( min(train$microbusiness_density), 
  quantile(train$microbusiness_density, probs = c(0.01, 0.05, .5, .95, .99)),
           max(train$microbusiness_density))
idx <- which(train$microbusiness_density == max(train$microbusiness_density))
train[which(train$cfips == train[idx,'cfips']), ]
plot(X$microbusiness_density, type='n', ylim=c(0,), col='grey80')
for(cfip in cfips[1:100]){
  X <- train[which(train$cfips == cfip), ]
  points(X$microbusiness_density, type='l', col='grey80')
}
