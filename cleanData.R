# Clean SAGE2015

sa <- read.csv("SAGE2015.csv")
names(sa)
summary(sa)

# Fix proficiency
sa$Percent.Proficient <- as.numeric(sub("%","", sa$Percent.Proficient))/100

# Try and tidy the data
# Spread out the data by subject
sa2<-spread(sa, Subject, Percent.Proficient, drop=TRUE)
# Consolidate the rows
sa2<-aggregate(x=sa2[subNames], by=list(sa2$SchoolName), min, na.rm=TRUE)
#Replace infs with NA
sa2 <- do.call(data.frame, lapply(sa2, function(x) replace (x, is.infinite(x),NA)))
# To do--Fix names
