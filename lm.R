ttvar <- AllTypes[1]
ttact.lm <- lm(Price ~ Year, Reshaped[Reshaped$Type == ttvar,])
ttact.sum <- summary(ttact.lm)
ttslope <- as.data.frame(ttact.sum$coefficients[2,c(1,4), drop = FALSE])
ttconfint <- as.data.frame(confint(ttact.lm, 'Year', level=0.95))
Seedl.lm.df <- data.frame(Var = ttvar,
                          Estimate = ttslope$Estimate,
                          Lower.ci = ttconfint[,1],
                          Upper.ci = ttconfint[,2],
                          p.val = ttslope[,2]
                          )
for(ttvar in AllTypes[-1]){
    ttact.lm <- lm(Price ~ Year, Reshaped[Reshaped$Type == ttvar,])
    ttact.sum <- summary(ttact.lm)
    ttslope <- as.data.frame(ttact.sum$coefficients[2,c(1,4), drop = FALSE])
    ttconfint <- as.data.frame(confint(ttact.lm, 'Year', level=0.95))
    NewSeedl.lm.df <- data.frame(Var = ttvar,
                                 Estimate = ttslope$Estimate,
                                 Lower.ci = ttconfint[,1],
                                 Upper.ci = ttconfint[,2],
                                 p.val = ttslope[,2]
                                 )
    Seedl.lm.df <- rbind(Seedl.lm.df, NewSeedl.lm.df)
}
write.table(Seedl.lm.df, "Meredek.csv", dec = ",", sep = ";", row.names = FALSE)
