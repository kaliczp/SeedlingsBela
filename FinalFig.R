levels(Reshaped$Type)
Selected <- Reshaped[Reshaped$Type == "KST 2/0 MCS" |
                     Reshaped$Type == "SZNY 1/0 MCS"|
                     Reshaped$Type == "Juhar 1/0 MCS", ]
Selected$Source <- factor(Selected$Source,
                          levels = c("hegy", "domb", "sik", "magan"),
                          labels = c("Public-Mountainy", "Public-Hilly", "Public-Lowland", "Private")
                          )
Selected$Type <- factor(Selected$Type, labels = c("Quercus robur 2/1", "Populus pubescens 1/0", "Acer spec. 1/0"))
names(Selected) <- c("Nurseries", "Year", "Type", "Price")

# jpeg(width = 15, height = 10, units = "cm", res = 300)
pdf(width = 15 / 2.54, height = 10 / 2.54)
ggplot(data = Selected, aes(x=Year, y = Price, group = Type)) +
    geom_point(aes(colour = Nurseries)) +
    geom_smooth(method = "lm") +
    facet_wrap(~Type) +
    scale_x_continuous(breaks = c(2008, 2010, 2012, 2014, 2016)) +
    scale_y_continuous(limits = c(0,27)) +
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=1))
dev.off()
