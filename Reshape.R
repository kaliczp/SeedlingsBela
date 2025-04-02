df <- hegy
ttmp <- colnames(df)
ttmp[1] <- "Category"
colnames(df) <- ttmp
Reshaped <- as.data.frame.table(`colnames<-`(t(df[-1]), df$Category))
Reshaped <- cbind(Var0 = "hegy", Reshaped)
for(ttcat in c("domb", "sik", "magan")) {
    assign("df", get(ttcat))
    ttmp <- colnames(df)
    ttmp[1] <- "Category"
    colnames(df) <- ttmp
    NewReshaped <- as.data.frame.table(`colnames<-`(t(df[-1]), df$Category))
    NewReshaped <- cbind(Var0 = ttcat, NewReshaped)
    Reshaped <- rbind(Reshaped, NewReshaped)
}
names(Reshaped) <- c("Source", "Year", "Type", "Price")

Reshaped$Year <- as.numeric(as.character(Reshaped$Year))

library(ggplot2)

ggplot(data = Reshaped, aes(x=Year, y = Price, group = Type)) + geom_smooth() + facet_wrap(~Type)

ggplot(data = Reshaped, aes(x=Year, y = Price, group = Type)) + geom_point(aes(colour = Source)) + geom_smooth(method = "lm") + facet_wrap(~Type)

