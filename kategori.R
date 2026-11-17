source("datasetLibrary.R")

#barchart
HujanProduk <- ggplot(df, aes(x = Hujan, fill = Produktivitas))+
    geom_bar(position = 'dodge', stat = 'count', color = "black")+
    labs(
        title = "Pengaruh Hujan terhadap Produktivitas",
        x = "Hujan",
        y = "Produktivitas"
    )+
    theme_minimal()+
    theme(legend.position = "right")+
    theme(plot.title = element_text(face = "bold", hjust = 0.5))+
    scale_fill_brewer(palette = "")

HujanProduk

#piechart
konsumAir <- ggplot(df, aes(x = '', fill = konsumsiAIR))+
    geom_bar(width = 1, stat = 'count', color = 'black')+
    coord_polar(theta = 'y')+
    labs(
        title = "Piechart Konsumsi Air Kondisi Kemarau",
        fill = "Konsumsi Air"
    )+
    theme_void()+
    theme(plot.title = element_text(face = "bold", hjust = 1))+
    scale_fill_brewer(palette = "")

konsumAir

visualisasi1 <- grid.arrange(arrangeGrob(HujanProduk, konsumAir))
ggsave(
    "Pengaruh Hujan & Frekuensi Konsumsi Air.jpeg",
    plot = visualisasi1,
    dpi = 300,
    path = "output/"
)