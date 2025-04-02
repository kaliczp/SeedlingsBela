ttvar <- AllTypes[1]
ttact.lm <- lm(Price ~ Year, Reshaped[Reshaped$Type == ttvar,])
ttact.sum <- summary(ttact.lm)
ttslope <- as.data.frame(ttact.sum$coefficients[2,c(1,4), drop = FALSE])
ttconfint <- round(as.data.frame(confint(ttact.lm, 'Year', level=0.95)), 3)
Seedl.lm.df <- data.frame(Var = ttvar,
                          Estimate = round(ttslope$Estimate,3),
                          Lower.ci = ttconfint[,1],
                          Upper.ci = ttconfint[,2],
                          p.val = round(ttslope[,2],5)
                          )
for(ttvar in AllTypes[-1]){
    ttact.lm <- lm(Price ~ Year, Reshaped[Reshaped$Type == ttvar,])
    ttact.sum <- summary(ttact.lm)
    ttslope <- as.data.frame(ttact.sum$coefficients[2,c(1,4), drop = FALSE])
    ttconfint <- round(as.data.frame(confint(ttact.lm, 'Year', level=0.95)),3)
    NewSeedl.lm.df <- data.frame(Var = ttvar,
                                 Estimate = round(ttslope$Estimate,3),
                                 Lower.ci = ttconfint[,1],
                                 Upper.ci = ttconfint[,2],
                                 p.val = round(ttslope[,2],5)
                                 )
    Seedl.lm.df <- rbind(Seedl.lm.df, NewSeedl.lm.df)
}
write.table(Seedl.lm.df, "Meredek.csv", dec = ",", sep = ";", row.names = FALSE)
