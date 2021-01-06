#Preparation
#import necessary libraries
library(tidyverse)
library(tibble)
library(ggplot2)

#import and proof read datasets 
advertiser <- read_csv("advertiser.csv", col_names = TRUE)
View(advertiser)

campaigns <- read_csv("campaigns.csv", col_names = TRUE)
View(campaigns)

clicks <- read_csv("clicks.csv", col_names = TRUE)
View(clicks)

conversions <- read_csv("conversions.csv", col_names = TRUE)
View(conversions)

impressions <- read_csv("impressions.csv", col_names = TRUE)
View(impressions)

#check for any missing data
is.na(advertiser)
is.na(campaigns)
is.na(clicks)
is.na(conversions)
is.na(impressions)

#convert input to count for analysis
clicks_count <- clicks %>% count(campaign_id)
view(clicks_count)
colnames(clicks_count) <-c('campaign_id', 'clicks')

conversions_count <- conversions %>% count(campaign_id)
view(conversions_count)
colnames(conversions_count) <-c('campaign_id', 'conversions')

impressions_count <- impressions %>% count(campaign_id)
view(impressions_count)
colnames(impressions_count) <-c('campaign_id', 'impressions')

#use joins to amalgamate the datasets
advertise_campaign <- inner_join(advertiser, campaigns, by = c('ID' = 'advertiser_id'))
view(advertise_campaign)
colnames(advertise_campaign) <- c('advertiser_id', 'company_name', 'campaign_id', 'advertisement', 'budget')
view(advertise_campaign)

advertise_campaign <- left_join(advertise_campaign, clicks_count, by = c('campaign_id'))
view(advertise_campaign)

advertise_campaign <- left_join(advertise_campaign, conversions_count, by = c('campaign_id'))
view(advertise_campaign)

advertise_campaign <- left_join(advertise_campaign, impressions_count, by = c('campaign_id'))
view(advertise_campaign)

#remove any n/a values with 0 for values which have no count
advertise_campaign$clicks[which(is.na(advertise_campaign$clicks))] <- 0
view(advertise_campaign)

advertise_campaign$conversions[which(is.na(advertise_campaign$conversions))] <- 0
view(advertise_campaign)

advertise_campaign$impressions[which(is.na(advertise_campaign$impressions))] <- 0
view(advertise_campaign)

#CTR Click-through-rate
advertise_campaign <- advertise_campaign %>% mutate(CTR = round(clicks/impressions,2) * 100)
view(advertise_campaign)

#Cost per impression
advertise_campaign <- advertise_campaign %>% mutate(CPImpression = round(budget/impressions,2),budget)
view(advertise_campaign)

#CPC Cost Per Click
advertise_campaign <- advertise_campaign %>% mutate(CPC = round(budget/clicks,2), budget)
view(advertise_campaign)

#Cost Per Conversion
advertise_campaign <- advertise_campaign %>% mutate(CPConversion = round(budget/conversions,2),budget)
view(advertise_campaign)

#view the budget in index
cpc = advertise_campaign['CPC']
budget = advertise_campaign['budget']
view(budget)

#inputation, sub in max value for infinite 
cpc = unlist(cpc)
mx = max(cpc[!is.infinite(cpc)])
mx
#assumption - duplicate budget to analyse further
fact = 2
mx_val = mx*fact
mx_val

#remove infinite for analysis purposes
cpc[which(is.infinite(cpc))] <- mx_val
view(cpc)

#density alternative for emperical distribution
dens = density(cpc)
plot(dens)
#Same for histogram
dens_hist = hist(cpc)
plot(dens_hist)

#cumulative probability(emperical cumulative density function)
ec = ecdf(cpc)
plot(ec)
p = ec(cpc)
p

#add cumilative probabilities to table
advertise_campaign <- advertise_campaign %>% mutate(CPC_score = round((1-p)*100,2))
view(advertise_campaign)

#Graph Analysis
#shows the number of company advertisements
no_companies <- ggplot(data = advertise_campaign) +geom_bar(mapping = aes(x = company_name)) +ggtitle("Number of campany advertisment occurances")
no_companies

#shows the companies total budget for advertisements
company_budget <- ggplot(data = advertise_campaign) +geom_line(mapping = aes(x = budget, y = company_name)) +ggtitle("Companies budget per advertisement")
company_budget

#barchart for the number of impressions per campaign
barplot(height=advertise_campaign$impressions, names=advertise_campaign$campaign_id)

#barchart for clicks per campaign
barplot(height=advertise_campaign$clicks, names=advertise_campaign$campaign_id)

#barchart for conversions per campaign
barplot(height=advertise_campaign$conversions, names=advertise_campaign$campaign_id)

#barchart for impressions per advertisement
barplot(height=advertise_campaign$impressions, names=advertise_campaign$advertiser_id)

#barchart for clicks per advertisement
barplot(height=advertise_campaign$clicks, names=advertise_campaign$advertiser_id)

#barchart for clicks per advertisement
barplot(height=advertise_campaign$conversions, names=advertise_campaign$advertiser_id)
