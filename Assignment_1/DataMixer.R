getwd()
MyData <- read.csv("measurements.csv", header=T)

Limb.width <- ifelse(MyData$UnitsW == "cm", 1, 0.1)*MyData$Limb.Width

Limb.Length <- ifelse(MyData$UnitsL == "cm", 1, 0.1)*MyData$Limb.Length

Volume <- (pi*(Limb.width/2)^2)*Limb.Length

MyData <- data.frame(MyData, Volume)

library(ggplot2)

ggplot(data = MyData, aes(x=Limb.Length, y=Limb.width)) +
         geom_point(size = 4) + theme_classic() + 
  ggtitle(" Various Species Limb Dimensions") + theme(plot.title = element_text(hjust = 0.5)) +
  labs(x = "Limb Length", y = "Limb Width") 
  
