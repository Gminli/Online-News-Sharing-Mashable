# Online-News-Sharing-Mashable

The dataset D5.2 (described in C5.2) contains information of online news articles published by Mashable (www.mashable.com). Some of these articles contain videos. Our primary question in this assignment is whether including at least one video in an article leads to the article being shared more in social media. Accordingly, the key outcome is “shares”—the number of social media shares for each article.

1. Task 1:

   a. Define a treatment indicator variable that equals 1 if the number of videos included in an article (num_videos) is larger than zero, and which equals 0 otherwise.

   b. Based on linear regression results (i.e., correlational estimate), is the treatment associated to a typically larger or lower number of shares?

2. Task 2:
   
   a.Create a matched sample based on logistic propensity scores.
   
   b. Assess the balancing of the matched sample.

   c. Assess the overlap of the matched sample.

3. Task 3:
   
   a.Do videos increase the number of shares? Estimate the ATE for the treatment defined as an article including at least one video. By how much? For simplicity, base your answer on a regression of the outcome on the treatment indicator (ie, do not include other covariates).
   
   b.Does the ATE differ from the correlational estimate of 1.a? If so, what may explain this difference?

   c. Does the ATE depend on the specific number of videos included? To address this question, compare the ATEs obtained in two cases: (i) articles that include no videos versus articles that contain 1 video, and (ii) articles that include 1 video versus articles that contain 2 or more videos
