#Task 1

# Work space preliminaries  
#setwd
rm(list = ls())  
ds <- read.csv("D5.2 Mashable.csv")   
summary(ds) 

# a. Define a treatment indicator variable that equals 1 if the number of videos 
#included in an article (num_videos) is larger than zero, and which equals 0 otherwise.
ds$indicator<-NA
ds$indicator[ds$num_videos>0]<-1
ds$indicator[ds$num_videos==0 & is.na(ds$indicator)]<-0
                         
#b. Based on linear regression results (i.e., correlational estimate), whether the 
#treatment associated to a typically larger or lower number of shares
reg1<-lm(formula=shares~indicator,data=ds)
summary (reg1)
#drawing from the p-value of 2e-16, which smaller than 0.05, there is significant correlation between share and video numbers
#since the coefficient is 1418.71, which means the treatment associated to a larger number of shares

#Task 2:
#a. Create a matched sample based on logistic propensity scores.
# Perform matching 
# Required packages
library(MatchIt) 
matched <- matchit(indicator ~ num_imgs+num_keywords+n_tokens_title+n_tokens_content
                   +category+weekday,method = "nearest", data = ds)
matched 

#b. Assess the balancing of the matched sample.
plot(summary(matched, standardize = TRUE))
summary(matched)

#c. Assess the overlap of the matched sample.
# Overalp assessment 
plot(matched,  type = "jitter", interactive = FALSE)
plot(matched,  type = "histogram", interactive = FALSE)

#Task 3:
#a. Do videos increase the number of shares? Estimate the ATE for the
#treatment defined as an article including at least one video. 
# Create matched data set 
ds_matched = match.data(matched, distance = "pscore") 
dim(ds_matched)
table(ds_matched$indicator)

# Estimate ATE 
summary(lm(shares~ indicator, data = ds_matched))  
summary(lm(shares~ indicator, data = ds)) 
summary(lm(shares ~ num_imgs+num_keywords+n_tokens_title+n_tokens_content
           +category+weekday, data = ds_matched))
summary(lm(shares ~ num_imgs+num_keywords+n_tokens_title+n_tokens_content
           +category+weekday, data = ds))

#c.Does the ATE depend on the specific number of videos included? 
# (i) articles that include no videos vs articles that contain 1 video
summary(lm(shares ~ num_videos, data = ds_matched[ds_matched$num_videos==0|ds_matched$num_videos==1,]))  
table(ds_matched$indicator[ds_matched$num_videos])

# (ii) articles that include 1 video vs articles that contain 2 or more videos

summary(lm(shares ~num_videos, data = ds_matched[ds_matched$num_videos==1|ds_matched$num_videos>=2,]))  
table(ds_matched$indicator[ds_matched$num_videos])
