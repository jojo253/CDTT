bottom <- -50
lb <- 50
b <- 75
rb <- 100
top <- 200

cax <- 2
# par(mfrow=c(2,2))

# blank in betten
pdf("plot1.pdf")

Believe <- Vectorize(function(x) if(x<=lb) 0 else if(x>=rb) 1)
curve(Believe,bottom,lb,xlim=c(0,150),ylim=c(0,1),bty='l',xaxt='n',yaxt='n',xlab='',ylab='')
curve(Believe,rb,top,add=T)
axis(2,at=seq(0,1),las=1,cex.axis=cax)
axis(1,c(lb,rb),label=c(expression(A[L]),expression(A[R])),cex.axis=cax)
# title(xlab='Amount of sand',ylab='',line=0)
# title(main="Figrue 1: Believe in single context",sub="Believe(B|C)",line=2)
dev.off()

# single border
pdf("plot2.pdf")

Truth <- Vectorize(function(x) if(x<b) 0 else if(x>=b) 1)
curve(Truth,bottom,top,xlim=c(0,150),n=10001,ylim=c(0,1),bty='l',xaxt='n',yaxt='n',xlab='',ylab='')
axis(2,at=seq(0,1),las=1,cex.axis=cax)
axis(1,c(b),label=c(expression(A[i])),cex.axis=cax)
# title(xlab='Amount of sand',ylab='',line=0)
# title(main="Figrue 2: Truth in single context",sub="Truth(T|C)",line=2)
dev.off()

# degrees of truth
pdf("plot3.pdf")

x <- bottom:top
y=pnorm(x,mean=b,sd=10)
plot(x,y,type='l',xlim=c(0,150),ylim=c(0,1),bty='l',xaxt='n',yaxt='n',xlab='',ylab='')
axis(2,at=seq(0,1),las=1,cex.axis=cax)
axis(1,c(lb,rb),label=c(expression(A[L]),expression(A[R])),cex.axis=cax)
# title(xlab='Amount of sand',ylab='',line=0)
# title(main="Figrue 3: Total Believe",sub="Believe(B)",line=2)
dev.off()

# infinite border
pdf("plot4.pdf")

curve(Believe,0,50,xlim=c(0,150),ylim=c(0,1),bty='l',xaxt='n',yaxt='n',xlab='',ylab='')
for (i in lb:rb){
	b=i
	curve(Truth,-50,200,n=10001,add=T)
}
axis(2,at=seq(0,1),las=1,cex.axis=cax)
axis(1,c(lb,rb),label=c(expression(A[L]),expression(A[R])),cex.axis=cax)
# title(xlab='Amount of sand',ylab='',line=0)
# title(main="Figrue 4: Total Truth",sub="Truth(T)",line=2)

dev.off()
