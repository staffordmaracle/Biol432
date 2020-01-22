
Species<-c("Pan paniscus","Elephas maximus indicus","Vulpes lagopus","Ursus arctos","Spheniscus mendiculus","Dermochelys coriacea","Hippopotamus amphibius","Panthera onca","Mustela nigripes","Ateles paniscus")

Limb.width <- abs(rnorm(10, mean=10, sd=10))

unitsW <- rbinom(10, 1, 0.5) 

unitsW <- ifelse(unitsW == 1, "mm", "cm")

Limb.length <- abs(rnorm(10, mean=100, sd=100))

unitsL <- rbinom(10, 1, 0.5)

unitsL <- ifelse(unitsL == 1, "mm", "cm")

MyData <- data.frame(Species = Species, Limb.Width = Limb.width, 
                     UnitsW = unitsW, Limb.Length = Limb.length, UnitsL = unitsL)
write.csv(MyData, "measurements.csv")
