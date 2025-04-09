levels(Reshaped$Type)
Selected <- Reshaped[Reshaped$Type == "KST 2/0 MCS" |
                     Reshaped$Type == "SZNY 1/0 MCS"|
                     Reshaped$Type == "Juhar 1/0 MCS", ]
Selected$Source <- factor(Selected$Source,
                          levels = c("hegy", "domb", "sik", "magan"),
                          labels = c("Mountains", "Hills", "Plains", "Private")
                          )

ggplot(data = Selected, aes(x=Year, y = Price, group = Type)) +
    geom_point(aes(colour = Source)) +
    geom_smooth(method = "lm") +
    facet_wrap(~Type) +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1))
