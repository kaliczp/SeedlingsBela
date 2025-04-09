levels(Reshaped$Type)
Selected <- Reshaped[Reshaped$Type == "KST 2/0 MCS" |
                     Reshaped$Type == "SZNY 1/0 MCS"|
                     Reshaped$Type == "Juhar 1/0 MCS", ]
Selected$Source <- factor(Selected$Source,
                          levels = c("hegy", "domb", "sik", "magan"),
                          labels = c("Mountains", "Hills", "Plains", "Private")
                          )
Selected$Type <- factor(Selected$Type, labels = c("Q. robur 2/1", "Populus 1/0", "Acer 1/0"))

ggplot(data = Selected, aes(x=Year, y = Price, group = Type)) +
    geom_point(aes(colour = Source)) +
    geom_smooth(method = "lm") +
    facet_wrap(~Type) +
    scale_x_continuous(breaks = c(2008, 2010, 2012, 2014, 2016)) +
    theme(axis.text.x = element_text(angle = 45, vjust = 0.5, hjust=1))
