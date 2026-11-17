source("datasetLibrary.R")

#penentuan bins
class <- (1 + 3.3 * log10(length(df$suhuKemarau)))
if(class %% 1 >= 0.5) {
    fixClass = as.integer(class) + 1
}else {
    fixClass = as.integer(class)
}s

#histogram
histoSuhu <- ggplot(df, aes(x = suhuKemarau))+
    geom_histogram(
        bins = fixClass,
        fill = "lightblue",
        color = "black",
    )+
    geom_vline(aes(xintercept = mean(suhuKemarau), fill = "black", linetype = "dashed", size = 1))+
    labs(
        title = "Histogram Rerata Suhu saat Kemarau",
        x = "Suhu Kemarau",
        y = "Frekuensi"
    )+
    theme_minimal()+
    theme(
        plot.title = element_text(face = "bold", hjust = 0.5),
        legend.position = "none"
    )

histoSuhu

boxAQI <- ggplot(df, aes(x = AQI, y = '', fill = AQI))+
    geom_boxplot(CoordFlip = 'horizontal', fill = 'lightblue')+
    geom_jitter(size = 3)+
    labs(
        title = "Persebaran Data Variable AQI",
        x = "AQI"
    )+
    theme(
        plot.title = element_text(face = "bold", hjust = 0.5),
        legend.position = "none"
    )

boxAQI

grid.arrange(arrangeGrob(histoSuhu, boxAQI))
visualisasi2 <- grid.arrange(arrangeGrob(HujanProduk, konsumAir))
ggsave(
    "Histogram Suhu & Boxplot AQI.jpeg",
    plot = visualisasi2,
    dpi = 300
)