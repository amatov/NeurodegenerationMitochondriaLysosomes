#write.table(res, file = "Result_Experiment.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#
####################################################################
####################################################################
####################################################################
#
library(lattice)
library(doBy)
Count <- function(x,...){c(count=length(x))}
Mean  <- function(x,...){c(mean=mean(x, na.rm=TRUE))}
Median  <- function(x,...){c(med=median(x, na.rm=TRUE))}
SegName  <- function(x,...){c(SegName=x[1])}
Fraction <- function(x,y){ ifelse(y != 0, x/y, NA)}
library(RColorBrewer)
brewer.pal(8,"Set1")->pal
#library(ggplot2)
#--------------------------------------------
# figure 1. histogram of sizes
#--------------------------------------------
PrintToPdf=TRUE;
if(PrintToPdf){ pdf("MotionFigs1.pdf") }
SH = summaryBy(Size ~ setid + Object + Line, data=res, FUN=min)
colnames(SH) =  c("setid","Object","Line","Size")
pdf("MitoSize_Update01.pdf")
boxplot( Size ~ Line, data =SH, ylab="mito diameter [mum]", xlab ="Line" , stack = FALSE, col=pal );
ggplot(SH, aes(x=Size, color=Line, fill=Line)) + geom_bar(position="dodge", binwidth = 0.1) + xlab("mito diameter [mum]") + ylab("mito count")
dev.off()
#h = histogram( ~ Size | Line,  data=SH, xlab="size [mum]", col="grey80",stack = TRUE, ylab="percent of mitochondria")
#b=seq(0.4,4,by=0.4);
#Lines=unique(SH$Line)
#dat_hh = NULL;
#for (thisLine in Lines){
#  h = hist(SH$Size[SH$Line==thisLine], breaks=b, plot=FALSE);
#  dat_h = data.frame(Line=rep(thisLine, length(h$mids)),Size=h$mids,percent=h$counts/sum(h$counts)*100);
#  dat_hh=rbind(dat_hh,dat_h);
#}
#p <- ggplot(dat_hh, aes(fill=Line, y=percent, x=Size)) 
#p + geom_bar(stat = "identity", position="dodge")+ xlab("size [mum]")+ylab("percent of mitochondria");
#------------------------------------------------
# number of mitochondria per 10 microns of axon
#------------------------------------------------
filesAxon = gsub("points", "axonxy", filesPnts);
d = matrix(data = NA, ncol=4, nrow=0);
colnames(d) = c("setid","movie","axy_length","av_mits_per_movie");
NumOfMitosStats = d;
for (ff in 1:length(filesPnts)){
  cat("... reading again ",filesPnts[ff], "\n"); dum <- flush.console();
  this_setid = gsub("video.*", "", filesPnts[ff]);
  this_movie = gsub(".nd2","", strsplit(filesPnts[ff], "/")[[1]][1]);
  t1 = read.csv(filesPnts[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  #average number of mitos detected per movie
  av_mits_per_movie = mean(table(t1$frameInd));
  #find length of axon
  axy = read.csv(filesAxon[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  axy_length = dscale * max( cumsum(sqrt(diff(axy[,1])^2 +  diff(axy[,2])^2)));
  NumOfMitosStats = rbind(NumOfMitosStats, c(this_setid,this_movie,axy_length,av_mits_per_movie))
}
cat("done\n"); dum <- flush.console();
NumOfMitosStats=as.data.frame(NumOfMitosStats,stringsAsFactors=FALSE);
NumOfMitosStats$axy_length=as.numeric(NumOfMitosStats$axy_length);
NumOfMitosStats$av_mits_per_movie=as.numeric(NumOfMitosStats$av_mits_per_movie);
NumOfMitosStats$mits_per_micron=NumOfMitosStats$av_mits_per_movie/NumOfMitosStats$axy_length;
boxplot( mits_per_micron ~ setid, data=NumOfMitosStats, xlab="Line", ylab="# mito per micron", col=pal )
write.table(NumOfMitosStats, file = "NumOfMitosPerUnitLength_Stat.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#----------------------------------------------------
#  define stationary and mobile mitochindria
#----------------------------------------------------
#compute displacement
Critical_Displacement = 2; #micrometers
delta <- function(x){max(x)-min(x)};
dspl <- summaryBy( Distance ~ setid +  Object +Line ,data=res, FUN=c(delta) );
colnames(dspl)[grep("Distance.delta", colnames(dspl))] <- "displacement"; 
res <- merge( res, dspl, by.x = c("setid","Object","Line"), by.y = c("setid","Object","Line") )
res$Mobility <- "Stationary"
res$Mobility [ res$"displacement" >  Critical_Displacement ] <- "Mobile";
#---------------------------------------------
# figure X. percent of mobile motochondria
#---------------------------------------------
dspl1=dspl
dspl1$Mobility <- "Stationary"
dspl1$Mobility [ dspl1$"displacement" >  Critical_Displacement ] <- "Mobile";
dspl1_stat = as.data.frame(tapply (dspl1$Object, list (factor(dspl1$setid), factor(dspl1$Mobility)), Count));
dspl1_stat$fraction = dspl1_stat$Mobile / ( dspl1_stat$Mobile+dspl1_stat$Stationary)
dspl1_stat$Line = dspl1$Line[ match( rownames(dspl1_stat), dspl1$setid)];
boxplot(fraction ~ Line, data=dspl1_stat, col=pal, xlab="Line", ylab="percent of mobile mito" );
write.table(dspl1_stat, file = "PercentOfMobileMito.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#---------------------------------------------
# percent of time spent paused
#---------------------------------------------
Critical_Velocity = 0.1;
res$Paused = abs(res$Velocity) < Critical_Velocity ;
res$Direction = ifelse(res$Velocity>0,"Anterograde","Retrograde");
SV = summaryBy(Paused ~ setid + Line + Direction, data=res, FUN=mean)
bwplot(Paused.mean ~ Line | Direction, data=SV, fill=pal, xlab="Line", ylab="percent of time spent paused" );
SV1 = summaryBy(Paused ~ setid + Line + Direction + Mobility, data=res, FUN=mean)
bwplot(Paused.mean ~ Line | Direction * Mobility , fill=pal, data=SV1, xlab="Line", ylab="percent of time spent paused" );
cat("Retrograde\n");
df=subset(SV,Direction=="Retrograde"); 
#t.test(Paused.mean ~ Line, data=df)
kruskal.test(df$Paused.mean,  factor(df$Line) )
cat("Anterograde\n");
df=subset(SV,Direction=="Anterograde"); 
#t.test(Paused.mean ~ Line, data=df)
kruskal.test(df$Paused.mean,  factor(df$Line) )
#----------------------------------------------------------
#
# plot velocity histograms
#
#----------------------------------------------------------
histogram(~ Velocity | Line, data=res[res$Mobility=="Mobile" & res$Direction =="Anterograde",], 
nint=200, xlab="[ mum/s ]", col="grey80",  xlim=c(-0.1,0.7) , type ="density", main="Anterograde");
histogram(~ Velocity | Line, data=res[res$Mobility=="Mobile" & res$Direction =="Retrograde",], 
nint=200, xlab="[ mum/s ]", col="grey80",  xlim=c(-0.7,0.1) , type ="density", main="Retrograde");
write.table( res, file = "all_trajs_stats.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
if(PrintToPdf){ dev.off() }
rm(list=ls());
#mydir = "y:/analysis/CMT/AxonalTransport/Plate4/";
#mydir = "o:/methodsCMT/mario2/scope_video/msaporta/Time laspe/Axonal transport/Plate 4/";
mydir = "D:/matlab/iPierian//";
PLOT_TRAJS=TRUE; FoutTrajsPdf = "Trajectories1.pdf";
setwd(mydir);
library(doBy);
library(lattice)
tscale=1.0; #seconds between frames
dscale=0.2; #mum per pixel
mov_dirs <- list.files(path = mydir, recursive=FALSE, pattern=".*nd2", full.names =FALSE);
mov_dirs <- mov_dirs[ file.info(mov_dirs)$isdir ];
files=NULL;
for (idir in mov_dirs ){
files_idir=list.files(path = idir,recursive=FALSE, pattern=".*tracks_Lcm.csv", full.names =TRUE);
files=append(files,files_idir);
}
filesPnts=gsub("tracks_Lcm", "points", files);
setids = gsub(".tracks","",files);
names(setids)=files
z=NULL;
for (ff in 1:length(files)){
  cat("working on ",files[ff], "\n"); dum <- flush.console();
  t = read.csv(files[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  colnames(t) = gsub(" |#|\\.","",colnames(t));
  t = cbind(t,setid=as.character(setids[ff]), stringsAsFactors=FALSE);
  cat("... merging it with ",filesPnts[ff], "\n"); dum <- flush.console();
  #merge with info on area and MeanIntensity
  t1 = read.csv(filesPnts[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  t2 = merge(t,t1[,c("Area","MeanIntensity","CentroidX","CentroidY","frameInd")], by.y=c("CentroidX","CentroidY","frameInd"), by.x=c("Xcm","Ycm","frameInd"), all.x=TRUE);
  z=rbind(z,t2);  
}
cat("done\n"); dum <- flush.console();
zt = z
colnames(zt) = c("Xcm","Ycm","Frame","Object","Lcm", "setid","Area","MeanIntensity");
zt = zt[order(zt$setid, zt$Object, zt$Frame),]
zt = cbind(zt, Time=zt$Frame*tscale, Distance=zt$Lcm*dscale,stringsAsFactors=TRUE);
cat("computing velocities using smoothed (cubic spline) datpoints\n"); dum <- flush.console();
res=NULL;
if(PLOT_TRAJS) {pdf("Trajectories1.pdf");}
for (jset in 1:length(setids)){
  cat("working on set ", setids[jset], "\n"); dum <- flush.console();
  z1 = zt[zt$setid==setids[jset],]
  z1$LcmFit = NA;
  z1$Velocity=NA;
  #z1$Area=NA;
  #z1$MeanIntensity=NA;
  ListOfObjects=unique(z1$Object);
  xrange=range(z1$Time);
  yrange=range(z1$Distance);
  plot(z1$Time, z1$Distance, col=z1$Object, t="p", 
main=as.character(setids[jset]), xlab="time [s]", ylab="position along axon [mum]", xlim=xrange, ylim=yrange);
  for (o in ListOfObjects){
    w = which(z1$Object==o);
    spl=smooth.spline(z1$Time[w], z1$Distance[w], all.knots =TRUE, spar=0.5); 
    dldt=predict(spl, deriv=1);
    z1$LcmFit[w]=spl$y;
    z1$Velocity[w]=dldt$y;
    z1$Area[w] = mean(z1$Area[w]);
    z1$MeanIntensity[w] = mean(z1$MeanIntensity[w]);
    lines(spl$x, spl$y, col=o, t="l", lwd=2);
  }; #o
res=rbind(res,z1);
}; #jset
if(PLOT_TRAJS) { dev.off() }
res$Size = sqrt(res$Area*4/pi)*dscale;
res$Line=gsub("video.*","",res$setid);
#write.table(res, file = "Result_Experiment.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#
####################################################################
####################################################################
####################################################################
#
library(lattice)
library(doBy)
Count <- function(x,...){c(count=length(x))}
Mean  <- function(x,...){c(mean=mean(x, na.rm=TRUE))}
Median  <- function(x,...){c(med=median(x, na.rm=TRUE))}
SegName  <- function(x,...){c(SegName=x[1])}
Fraction <- function(x,y){ ifelse(y != 0, x/y, NA)}
library(RColorBrewer)
brewer.pal(8,"Set1")->pal
#library(ggplot2)
#--------------------------------------------
# figure 1. histogram of sizes
#--------------------------------------------
PrintToPdf=TRUE;
if(PrintToPdf){ pdf("MotionFigs1.pdf") }
SH = summaryBy(Size ~ setid + Object + Line, data=res, FUN=min)
colnames(SH) =  c("setid","Object","Line","Size")
pdf("MitoSize_Update01.pdf")
boxplot( Size ~ Line, data =SH, ylab="mito diameter [mum]", xlab ="Line" , stack = FALSE, col=pal );
ggplot(SH, aes(x=Size, color=Line, fill=Line)) + geom_bar(position="dodge", binwidth = 0.1) + xlab("mito diameter [mum]") + ylab("mito count")
dev.off()
#h = histogram( ~ Size | Line,  data=SH, xlab="size [mum]", col="grey80",stack = TRUE, ylab="percent of mitochondria")
#b=seq(0.4,4,by=0.4);
#Lines=unique(SH$Line)
#dat_hh = NULL;
#for (thisLine in Lines){
#  h = hist(SH$Size[SH$Line==thisLine], breaks=b, plot=FALSE);
#  dat_h = data.frame(Line=rep(thisLine, length(h$mids)),Size=h$mids,percent=h$counts/sum(h$counts)*100);
#  dat_hh=rbind(dat_hh,dat_h);
#}
#p <- ggplot(dat_hh, aes(fill=Line, y=percent, x=Size)) 
#p + geom_bar(stat = "identity", position="dodge")+ xlab("size [mum]")+ylab("percent of mitochondria");
#------------------------------------------------
# number of mitochondria per 10 microns of axon
#------------------------------------------------
filesAxon = gsub("points", "axonxy", filesPnts);
d = matrix(data = NA, ncol=4, nrow=0);
colnames(d) = c("setid","movie","axy_length","av_mits_per_movie");
NumOfMitosStats = d;
for (ff in 1:length(filesPnts)){
  cat("... reading again ",filesPnts[ff], "\n"); dum <- flush.console();
  this_setid = gsub("video.*", "", filesPnts[ff]);
  this_movie = gsub(".nd2","", strsplit(filesPnts[ff], "/")[[1]][1]);
  t1 = read.csv(filesPnts[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  #average number of mitos detected per movie
  av_mits_per_movie = mean(table(t1$frameInd));
  #find length of axon
  axy = read.csv(filesAxon[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  axy_length = dscale * max( cumsum(sqrt(diff(axy[,1])^2 +  diff(axy[,2])^2)));
  NumOfMitosStats = rbind(NumOfMitosStats, c(this_setid,this_movie,axy_length,av_mits_per_movie))
}
cat("done\n"); dum <- flush.console();
NumOfMitosStats=as.data.frame(NumOfMitosStats,stringsAsFactors=FALSE);
NumOfMitosStats$axy_length=as.numeric(NumOfMitosStats$axy_length);
NumOfMitosStats$av_mits_per_movie=as.numeric(NumOfMitosStats$av_mits_per_movie);
NumOfMitosStats$mits_per_micron=NumOfMitosStats$av_mits_per_movie/NumOfMitosStats$axy_length;
boxplot( mits_per_micron ~ setid, data=NumOfMitosStats, xlab="Line", ylab="# mito per micron", col=pal )
write.table(NumOfMitosStats, file = "NumOfMitosPerUnitLength_Stat.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#----------------------------------------------------
#  define stationary and mobile mitochindria
#----------------------------------------------------
#compute displacement
Critical_Displacement = 2; #micrometers
delta <- function(x){max(x)-min(x)};
dspl <- summaryBy( Distance ~ setid +  Object +Line ,data=res, FUN=c(delta) );
colnames(dspl)[grep("Distance.delta", colnames(dspl))] <- "displacement"; 
res <- merge( res, dspl, by.x = c("setid","Object","Line"), by.y = c("setid","Object","Line") )
res$Mobility <- "Stationary"
res$Mobility [ res$"displacement" >  Critical_Displacement ] <- "Mobile";
#---------------------------------------------
# figure X. percent of mobile motochondria
#---------------------------------------------
dspl1=dspl
dspl1$Mobility <- "Stationary"
dspl1$Mobility [ dspl1$"displacement" >  Critical_Displacement ] <- "Mobile";
dspl1_stat = as.data.frame(tapply (dspl1$Object, list (factor(dspl1$setid), factor(dspl1$Mobility)), Count));
dspl1_stat$fraction = dspl1_stat$Mobile / ( dspl1_stat$Mobile+dspl1_stat$Stationary)
dspl1_stat$Line = dspl1$Line[ match( rownames(dspl1_stat), dspl1$setid)];
boxplot(fraction ~ Line, data=dspl1_stat, col=pal, xlab="Line", ylab="percent of mobile mito" );
write.table(dspl1_stat, file = "PercentOfMobileMito.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#---------------------------------------------
# percent of time spent paused
#---------------------------------------------
Critical_Velocity = 0.1;
res$Paused = abs(res$Velocity) < Critical_Velocity ;
res$Direction = ifelse(res$Velocity>0,"Anterograde","Retrograde");
SV = summaryBy(Paused ~ setid + Line + Direction, data=res, FUN=mean)
bwplot(Paused.mean ~ Line | Direction, data=SV, fill=pal, xlab="Line", ylab="percent of time spent paused" );
SV1 = summaryBy(Paused ~ setid + Line + Direction + Mobility, data=res, FUN=mean)
bwplot(Paused.mean ~ Line | Direction * Mobility , fill=pal, data=SV1, xlab="Line", ylab="percent of time spent paused" );
cat("Retrograde\n");
df=subset(SV,Direction=="Retrograde"); 
#t.test(Paused.mean ~ Line, data=df)
kruskal.test(df$Paused.mean,  factor(df$Line) )
cat("Anterograde\n");
df=subset(SV,Direction=="Anterograde"); 
#t.test(Paused.mean ~ Line, data=df)
kruskal.test(df$Paused.mean,  factor(df$Line) )
#----------------------------------------------------------
#
# plot velocity histograms
#
#----------------------------------------------------------
histogram(~ Velocity | Line, data=res[res$Mobility=="Mobile" & res$Direction =="Anterograde",], 
nint=200, xlab="[ mum/s ]", col="grey80",  xlim=c(-0.1,0.7) , type ="density", main="Anterograde");
histogram(~ Velocity | Line, data=res[res$Mobility=="Mobile" & res$Direction =="Retrograde",], 
nint=200, xlab="[ mum/s ]", col="grey80",  xlim=c(-0.7,0.1) , type ="density", main="Retrograde");
write.table( res, file = "all_trajs_stats.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
if(PrintToPdf){ dev.off() }
rm(list=ls());
mydir = "D:/matlab/iPierian//";
dc
cd
getwd()
ls
x <- c(1 2 3 4 5)
x <- c(1, 2, 3, 4, 5)
x
c
source("CMT_axonalTransport_Plate5.R")
source("CMT_axonalTransport_Plate5")
getwd()
setwd('\R-code')
setwd('/R-code')
setwd('D:/matlab/iPierian/R-code')
getwd()
source("CMT_axonalTransport_Plate5")
source("CMT_axonalTransport_Plate5.R")
load("D:\\matlab\\iPierian\\.RData")
source("CMT_axonalTransport_Plate5.R")
getwd()
setwd('D:/matlab/iPierian/R-code')
getwd()
source("CMT_axonalTransport_Plate5.R")
ls()
source("CMT_axonalTransport_Plate5.R")
getwd()
setwd('D:/matlab/iPierian/R-code')
source("CMT_axonalTransport_Plate5.R")
search()
rm(list=ls());
#mydir = "y:/analysis/CMT/AxonalTransport/Plate4/";
#mydir = "o:/methodsCMT/mario2/scope_video/msaporta/Time laspe/Axonal transport/Plate 4/";
mydir = "D:/matlab/iPierian/";
PLOT_TRAJS=TRUE; FoutTrajsPdf = "Trajectories1.pdf";
setwd(mydir);
library(doBy);
library(lattice)
tscale=1.0; #seconds between frames
dscale=0.2; #mum per pixel
mov_dirs <- list.files(path = mydir, recursive=FALSE, pattern=".*nd2", full.names =FALSE);
mov_dirs <- mov_dirs[ file.info(mov_dirs)$isdir ];
files=NULL;
for (idir in mov_dirs ){
files_idir=list.files(path = idir,recursive=FALSE, pattern=".*tracks_Lcm.csv", full.names =TRUE);
files=append(files,files_idir);
}
filesPnts=gsub("tracks_Lcm", "points", files);
setids = gsub(".tracks","",files);
names(setids)=files
z=NULL;
for (ff in 1:length(files)){
  cat("working on ",files[ff], "\n"); dum <- flush.console();
  t = read.csv(files[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  colnames(t) = gsub(" |#|\\.","",colnames(t));
  t = cbind(t,setid=as.character(setids[ff]), stringsAsFactors=FALSE);
  cat("... merging it with ",filesPnts[ff], "\n"); dum <- flush.console();
  #merge with info on area and MeanIntensity
  t1 = read.csv(filesPnts[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  t2 = merge(t,t1[,c("Area","MeanIntensity","CentroidX","CentroidY","frameInd")], by.y=c("CentroidX","CentroidY","frameInd"), by.x=c("Xcm","Ycm","frameInd"), all.x=TRUE);
  z=rbind(z,t2);  
}
cat("done\n"); dum <- flush.console();
zt = z
colnames(zt) = c("Xcm","Ycm","Frame","Object","Lcm", "setid","Area","MeanIntensity");
zt = zt[order(zt$setid, zt$Object, zt$Frame),]
zt = cbind(zt, Time=zt$Frame*tscale, Distance=zt$Lcm*dscale,stringsAsFactors=TRUE);
cat("computing velocities using smoothed (cubic spline) datpoints\n"); dum <- flush.console();
res=NULL;
if(PLOT_TRAJS) {pdf("Trajectories1.pdf");}
for (jset in 1:length(setids)){
  cat("working on set ", setids[jset], "\n"); dum <- flush.console();
  z1 = zt[zt$setid==setids[jset],]
  z1$LcmFit = NA;
  z1$Velocity=NA;
  #z1$Area=NA;
  #z1$MeanIntensity=NA;
  ListOfObjects=unique(z1$Object);
  xrange=range(z1$Time);
  yrange=range(z1$Distance);
  plot(z1$Time, z1$Distance, col=z1$Object, t="p", 
main=as.character(setids[jset]), xlab="time [s]", ylab="position along axon [mum]", xlim=xrange, ylim=yrange);
  for (o in ListOfObjects){
    w = which(z1$Object==o);
    spl=smooth.spline(z1$Time[w], z1$Distance[w], all.knots =TRUE, spar=0.5); 
    dldt=predict(spl, deriv=1);
    z1$LcmFit[w]=spl$y;
    z1$Velocity[w]=dldt$y;
    z1$Area[w] = mean(z1$Area[w]);
    z1$MeanIntensity[w] = mean(z1$MeanIntensity[w]);
    lines(spl$x, spl$y, col=o, t="l", lwd=2);
  }; #o
res=rbind(res,z1);
}; #jset
if(PLOT_TRAJS) { dev.off() }
res$Size = sqrt(res$Area*4/pi)*dscale;
res$Line=gsub("video.*","",res$setid);
#write.table(res, file = "Result_Experiment.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#
####################################################################
####################################################################
####################################################################
#
library(lattice)
library(doBy)
Count <- function(x,...){c(count=length(x))}
Mean  <- function(x,...){c(mean=mean(x, na.rm=TRUE))}
Median  <- function(x,...){c(med=median(x, na.rm=TRUE))}
SegName  <- function(x,...){c(SegName=x[1])}
Fraction <- function(x,y){ ifelse(y != 0, x/y, NA)}
library(RColorBrewer)
brewer.pal(8,"Set1")->pal
#library(ggplot2)
#--------------------------------------------
# figure 1. histogram of sizes
#--------------------------------------------
PrintToPdf=TRUE;
if(PrintToPdf){ pdf("MotionFigs1.pdf") }
SH = summaryBy(Size ~ setid + Object + Line, data=res, FUN=min)
colnames(SH) =  c("setid","Object","Line","Size")
pdf("MitoSize_Update01.pdf")
boxplot( Size ~ Line, data =SH, ylab="mito diameter [mum]", xlab ="Line" , stack = FALSE, col=pal );
ggplot(SH, aes(x=Size, color=Line, fill=Line)) + geom_bar(position="dodge", binwidth = 0.1) + xlab("mito diameter [mum]") + ylab("mito count")
dev.off()
#h = histogram( ~ Size | Line,  data=SH, xlab="size [mum]", col="grey80",stack = TRUE, ylab="percent of mitochondria")
#b=seq(0.4,4,by=0.4);
#Lines=unique(SH$Line)
#dat_hh = NULL;
#for (thisLine in Lines){
#  h = hist(SH$Size[SH$Line==thisLine], breaks=b, plot=FALSE);
#  dat_h = data.frame(Line=rep(thisLine, length(h$mids)),Size=h$mids,percent=h$counts/sum(h$counts)*100);
#  dat_hh=rbind(dat_hh,dat_h);
#}
#p <- ggplot(dat_hh, aes(fill=Line, y=percent, x=Size)) 
#p + geom_bar(stat = "identity", position="dodge")+ xlab("size [mum]")+ylab("percent of mitochondria");
#------------------------------------------------
# number of mitochondria per 10 microns of axon
#------------------------------------------------
filesAxon = gsub("points", "axonxy", filesPnts);
d = matrix(data = NA, ncol=4, nrow=0);
colnames(d) = c("setid","movie","axy_length","av_mits_per_movie");
NumOfMitosStats = d;
for (ff in 1:length(filesPnts)){
  cat("... reading again ",filesPnts[ff], "\n"); dum <- flush.console();
  this_setid = gsub("video.*", "", filesPnts[ff]);
  this_movie = gsub(".nd2","", strsplit(filesPnts[ff], "/")[[1]][1]);
  t1 = read.csv(filesPnts[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  #average number of mitos detected per movie
  av_mits_per_movie = mean(table(t1$frameInd));
  #find length of axon
  axy = read.csv(filesAxon[ff], as.is = TRUE, header = TRUE, sep = ",", check.names=FALSE, stringsAsFactors=FALSE);
  axy_length = dscale * max( cumsum(sqrt(diff(axy[,1])^2 +  diff(axy[,2])^2)));
  NumOfMitosStats = rbind(NumOfMitosStats, c(this_setid,this_movie,axy_length,av_mits_per_movie))
}
cat("done\n"); dum <- flush.console();
NumOfMitosStats=as.data.frame(NumOfMitosStats,stringsAsFactors=FALSE);
NumOfMitosStats$axy_length=as.numeric(NumOfMitosStats$axy_length);
NumOfMitosStats$av_mits_per_movie=as.numeric(NumOfMitosStats$av_mits_per_movie);
NumOfMitosStats$mits_per_micron=NumOfMitosStats$av_mits_per_movie/NumOfMitosStats$axy_length;
boxplot( mits_per_micron ~ setid, data=NumOfMitosStats, xlab="Line", ylab="# mito per micron", col=pal )
write.table(NumOfMitosStats, file = "NumOfMitosPerUnitLength_Stat.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#----------------------------------------------------
#  define stationary and mobile mitochindria
#----------------------------------------------------
#compute displacement
Critical_Displacement = 2; #micrometers
delta <- function(x){max(x)-min(x)};
dspl <- summaryBy( Distance ~ setid +  Object +Line ,data=res, FUN=c(delta) );
colnames(dspl)[grep("Distance.delta", colnames(dspl))] <- "displacement"; 
res <- merge( res, dspl, by.x = c("setid","Object","Line"), by.y = c("setid","Object","Line") )
res$Mobility <- "Stationary"
res$Mobility [ res$"displacement" >  Critical_Displacement ] <- "Mobile";
#---------------------------------------------
# figure X. percent of mobile motochondria
#---------------------------------------------
dspl1=dspl
dspl1$Mobility <- "Stationary"
dspl1$Mobility [ dspl1$"displacement" >  Critical_Displacement ] <- "Mobile";
dspl1_stat = as.data.frame(tapply (dspl1$Object, list (factor(dspl1$setid), factor(dspl1$Mobility)), Count));
dspl1_stat$fraction = dspl1_stat$Mobile / ( dspl1_stat$Mobile+dspl1_stat$Stationary)
dspl1_stat$Line = dspl1$Line[ match( rownames(dspl1_stat), dspl1$setid)];
boxplot(fraction ~ Line, data=dspl1_stat, col=pal, xlab="Line", ylab="percent of mobile mito" );
write.table(dspl1_stat, file = "PercentOfMobileMito.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
#---------------------------------------------
# percent of time spent paused
#---------------------------------------------
Critical_Velocity = 0.1;
res$Paused = abs(res$Velocity) < Critical_Velocity ;
res$Direction = ifelse(res$Velocity>0,"Anterograde","Retrograde");
SV = summaryBy(Paused ~ setid + Line + Direction, data=res, FUN=mean)
bwplot(Paused.mean ~ Line | Direction, data=SV, fill=pal, xlab="Line", ylab="percent of time spent paused" );
SV1 = summaryBy(Paused ~ setid + Line + Direction + Mobility, data=res, FUN=mean)
bwplot(Paused.mean ~ Line | Direction * Mobility , fill=pal, data=SV1, xlab="Line", ylab="percent of time spent paused" );
cat("Retrograde\n");
df=subset(SV,Direction=="Retrograde"); 
#t.test(Paused.mean ~ Line, data=df)
kruskal.test(df$Paused.mean,  factor(df$Line) )
cat("Anterograde\n");
df=subset(SV,Direction=="Anterograde"); 
#t.test(Paused.mean ~ Line, data=df)
kruskal.test(df$Paused.mean,  factor(df$Line) )
#----------------------------------------------------------
#
# plot velocity histograms
#
#----------------------------------------------------------
histogram(~ Velocity | Line, data=res[res$Mobility=="Mobile" & res$Direction =="Anterograde",], 
nint=200, xlab="[ mum/s ]", col="grey80",  xlim=c(-0.1,0.7) , type ="density", main="Anterograde");
histogram(~ Velocity | Line, data=res[res$Mobility=="Mobile" & res$Direction =="Retrograde",], 
nint=200, xlab="[ mum/s ]", col="grey80",  xlim=c(-0.7,0.1) , type ="density", main="Retrograde");
write.table( res, file = "all_trajs_stats.csv", sep=",", col.names=TRUE, row.names=FALSE, quote=TRUE, na="");
if(PrintToPdf){ dev.off() }
rm(list=ls());
source("CMT_axonalTransport_Plate5.R")
