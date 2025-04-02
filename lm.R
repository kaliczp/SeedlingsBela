ttvar <- AllTypes[1]
ttact.lm <- lm(Price ~ Year, Reshaped[Reshaped$Type == ttvar,])
ttact.sum <- summary(ttact.lm)
Seedl.lm.df <- cbind(Var = ttvar, as.data.frame(ttact.sum$coefficients[2,c(1,4), drop = FALSE]))
for(ttvar in AllTypes[-1]){
    ttact.lm <- lm(Price ~ Year, Reshaped[Reshaped$Type == ttvar,])
    ttact.sum <- summary(ttact.lm)
    NewSeedl.lm.df <- cbind(Var = ttvar, as.data.frame(ttact.sum$coefficients[2,c(1,4), drop = FALSE]))
    Seedl.lm.df <- rbind(Seedl.lm.df, NewSeedl.lm.df)
}
write.table(Seedl.lm.df, "Meredek.csv", dec = ",", sep = ";", row.names = FALSE)
