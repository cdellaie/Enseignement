# wavelets

install.packages("wavelets")
library(wavelets)

t=seq(0.1,4,0.001);
X=t*sin(1/(t**2/10));
plot(t,X, col='blue',type='s')

L=0.5;
N=integer(log((length(X)-1)/(L-1)+1))

N=1;
wvlt = dwt(X, filter="la8",N, boundary="periodic", fast=TRUE);

#other package
install.packages("wavethresh")
library(wavethresh)

xs = seq(1,700,length=512)
lo = floor(xs)
hi = ceiling(xs)
ys = (xs-lo)*wmap$Cl[hi] + (hi-xs)*wmap$Cl[lo] +
wmap$Cl[lo]*(lo==hi)

waveletwmap = wd(ys, family="DaubLeAsymm", filter.number=8)
softthreshwmap = threshold(waveletwmap,type="soft",policy="universal")
hardthreshwmap = threshold(waveletwmap,type="hard",policy="universal")

wr(softthreshwmap)

waveletwmap = wd(X, family="DaubLeAsymm", filter.number=8)
softthreshwmap = threshold(waveletwmap,type="soft",policy="universal")
hardthreshwmap = threshold(waveletwmap,type="hard",policy="universal")

wr(softthreshwmap)
