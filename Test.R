#Tests

# Exercice 1
#Lower Tail Test of the Population Mean H0| m>= m0 vs H1|m<m0
# A firm sells goods that are supposed to last for 10000 hours, you are hired to verify their claim.
# In a sample of 30 goods, their average longevity was of 9900 hours, the standard deviation of the sample being 120 hours. 
# Can we reject the claim at a 0.05 % significance rate ?

# Under H0, (sqrt n/sigma)(xbar-m0) is asymptotically N(0,1) and diverges under H1
N=30;
xbar= 9900;
sigma=120;

T=(sqrt(N)/sigma)*(xbar-10000);
# value of T = -4.564355

#critical value : the reject region of the test is (T< - \phi^{-1}(1-alpha)) where phi is the N(0,1) FDR 
alpha=0.05;
Rejection = (T< -qnorm(1-alpha))
# At a 0.05 significance level, we can rejcet the null hypothesis.
# Different method : using the p-value
pvalue = pnorm(T);
Rejection=(pvalue<alpha)
# What if the variance is supposed to be unknown, but the variance of the sample is computed as 125 hours ?
s=125;
TT=(sqrt(N)/s)*(xbar-10000); #is supposed to follow a Student(N-1) under H0 and to diverge under H1, is -4.3818
Rejection2=(TT< (-qt(1-alpha,df=N-1))); # We reject H0 at 0.05% significane level
# Power of the test
# Error of type : Failure of null hypothesis rejection when it should have been.
se=sigma/sqrt(N); #standard error


# Exercice 2
# Upper Tail Test of the Population Mean : H0| m =< m0 vs H1| m> m0
# Same example, but 
N=35;
xbar=2.1;
sigma=0.25;
alpha=0.05;
T=(sqrt(N)/sigma)*(xbar-2);
Rejection= (T>qnorm(1-alpha))
# We could also use the p-value
pvalue = pnorm(T);
Rejection=(pvalue<alpha)
# If the variance is unknown and the estimated variance is 
s=0.3;
TT=(sqrt(N)/s)*(xbar-2); 
Rejection2=(TT>qt(1-alpha,df=N-1)); 
#With the pvalue
pvalue= pt(TT, df=N-1, lower.tail=FALSE)
Rejection2=(pvalue<0.05) # we reject H0 at 0.05%

#Exercice 3
# 85 citizens out of 148 voted during the last election. Can we say that more than 60% of the population voted at a 0.05% significance rate ?
alpha=0.05;
p=85/148;
sigma=sqrt(0.6*(1-0.6));
P=(p-0.6)/(sigma/sqrt(148)); 
Rejection=(P<(-pnorm(1-alpha)))
#We do not reject the null hypothesis, we can say that more than 60% of voters voted last year.


