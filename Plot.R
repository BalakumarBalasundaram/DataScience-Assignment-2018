apple <- c(260, 400, 250, 200, 310)
peach <- c(180, 200, 210, 190, 170)
orange <- c(210, 250, 260, 330, 300)

fruits <- c(apple, peach, orange)
    
plot(apple, type="o", col="red", ylim=c(0,400), axes = F, ann=F)
axis(1, at=1:5, labels = c("Mon","Tue","Wed","Thu","Fri"))
axis(2, ylim=c(0,400))
title(main="Fruits", col.main="red", font.main=4)
title(xlab="Day", col.lab="black")
title(ylab="Qty", col.lab="blue")

par(new=T)
lines(peach, type="o", pch=21, col="green", lty=2)
lines(orange, type="o", pch=22, col="blue", lty=2)

legend(4, 130, c("apple","peach","orange"), col=c("red","green","blue"), 
       cex=0.8, pch=21, lty=1:3)



# multi graph on 1 window
par(mfrow = c(1,3))
plot(apple, type="o", col="red", ylim=c(0,400))
plot(peach, type="o", col="red", ylim=c(0,400))
plot(orange, type="o", col="red", ylim=c(0,400))
par(mfrow = c(1,1))

barplot(apple, main="Apple", xlab="Day", ylab="Qty", border="blue",
        names.arg = c("Mon","Tue","Wed","Thu","Fri"),
        density = c(10,30,50,70,90))

colors <- c()
for (i in 1:length(apple)) {
  if (apple[i] >= 300) {
    colors <- c(colors, "red")
  }
  else {
    colors <- c(colors, "grey")
  }
}

barplot(apple, main="Apple", xlab="Day", ylab="Qty", border="blue", col=colors,
        names.arg = c("Mon","Tue","Wed","Thu","Fri"))



fruits10 <- cbind(apple, peach, orange)
fruits10

barplot(as.matrix(fruits10), main="Fruits", ylab="Qty", ylim = c(0,450), 
        beside = T, col=rainbow(5))
legend(10, 450, c("Mon","Tue","Wed","Thu","Fri"), cex=0.8, fill=rainbow(5))


fruits11 <- t(fruits10)
colnames(fruits11) <- c(1,2,3,4,5)
fruits11

barplot(fruits11, main="Fruits", ylab="Qty", ylim = c(0,1100), col=rainbow(3), space=0.1,
        cex=0.8, cex.axis=0.8, las=1, names.arg=c("Mon","Tue","Wed","Thu","Fri"))
legend(4, 1100, rownames(fruits11), cex=0.8, fill=rainbow(3))


apple <- c(260, 400, 250, 200, 310)
pie(apple)

# 1.
pie(apple, init.angle = 90, col=rainbow(length(apple)), radius = 1,
    labels = c("Mon","Tue","Wed","Thu","Fri"))


f_ratio <- round(apple/sum(apple)*100, 1)
f_labels <- paste(f_ratio, "%", sep = "")

pie(apple, main="Apple", init.angle = 90, col=rainbow(length(apple)), radius = 0.8,
    cex=0.8, labels=f_labels)
legend(1,1, c("Mon","Tue","Wed","Thu","Fri"), cex=0.8, fill=rainbow(length(apple)))



# 3. --- 06_apple_pie_label

f_ratio <- round(apple/sum(apple)*100, 1)
f_days <- c("Mon","Tue","Wed","Thu","Fri")
f_labels <- paste(f_days, "\n", f_ratio, "%")
pie(apple, main="Apple", init.angle = 90, col=rainbow(length(apple)), radius = 1,
    cex=1.0, labels=f_labels)



#---------------------------------------------------------------
# 3D Pie Chart
#---------------------------------------------------------------

library(plotrix)

f_ratio <- round(apple/sum(apple)*100, 1)
f_days <- c("Mon","Tue","Wed","Thu","Fri")
f_labels <- paste(f_days, "\n", f_ratio, "%")

pie3D(apple, main="Apple", col=rainbow(length(apple)), cex=0.8, 
      labels=f_labels, explode=0.05)

boxplot(apple, peach, orange,
        col=c("red","yellow","green"),
        names=c("apple","peach","orange"),
        horizontal = T)



library(treemap)

data <- read.csv("C:\\Users\\balakumar\\Downloads\\R_DataAnalytics\\R_DataAnalytics\\R_JS\\data\\all_student_score.csv")
data


treemap(data, vSize="score", index="score")

treemap(data, vSize="team", index=c("score","name"))

treemap(data, vSize="score", index=c("team","score"))

