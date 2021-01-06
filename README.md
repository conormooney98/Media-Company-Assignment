# Media-Company-Assignment
This markdown file explains the functionality of the program in analysing advertising data for marketing purposes. The program should run on any data with the same file and column names substituted for the sample data. The program analyses ads where data on impressions, clicks and conversions is collected for a media company. This program can be run and this markdown file can be followed to produced real time analysis for anyone in the company who may want to carry out advertising analysis.

## Running of the program
When the program is run, it can be done in its entirety. i.e. Select All -> Conrol Enter. Before running, check to ensure that the packages in the R file are correctly installed and loaded in. The files need to be imported into the correct enviroment for the analysis to run. The program is ran under various headings and is structured as follows;

### Import libraries
    The libraries should be available, when installed and called.

### Import datasets
    The datasets should read in and view (dataset) should allow you to view the dataset and clarify if it has been done so correctly

### Check for missing data
    The sample dataset did not have any missing data, but it is good to check for any data gaps. The dataset tested will probably be much larger than the sample dataset, so it is best to check at the begining of the project for any possible set backs.

### Convert input to to count
*    The input in impressions, clicks and conversions were converted to count for analysis purposes, to perform calculations.
    <img width="220" alt="impression_count" src="https://user-images.githubusercontent.com/47594808/103804028-5a22d900-5049-11eb-9be3-08ecf43023c9.png">
    <img width="191" alt="clicks_count" src="https://user-images.githubusercontent.com/47594808/103804417-ffd64800-5049-11eb-9d5f-59d4191b8e56.PNG">
    <img width="220" alt="conversion count" src="https://user-images.githubusercontent.com/47594808/103804558-3b711200-504a-11eb-85ad-c6baf81f5a7b.PNG">

### Use joins to amalgamate the datasets
*    All of this data was joined into one table, so that the end user may look at any calculations in the one table. It also helped in the production of various graphs later on.
    <img width="682" alt="original_joins" src="https://user-images.githubusercontent.com/47594808/103805653-cb638b80-504b-11eb-93a2-6aa1ac2c9b82.PNG">

### Remove n/a values
*    Some of the conversions had no counts and appeared n/a, which was converted to 0. This was done as it allowed the graphs to be produced more successfully and became more visually pleasing.
    <img width="702" alt="remove na from join" src="https://user-images.githubusercontent.com/47594808/103806065-6197b180-504c-11eb-8b7f-4b6910a98771.PNG">

### Click Through Rate
*    Click through rate is the ratio of users who clicked over the total users who viewed(impressions). It is commonly used to measure the degree of success in the online advertising industry.
    <img width="748" alt="CTR" src="https://user-images.githubusercontent.com/47594808/103806271-ae7b8800-504c-11eb-9036-15382a996644.PNG">

### Cost Per Impression
*    Cost per impression is a calculation which shows how much an advertiser pays per display. This is an extremely important calculation in the real world, as many companies want to know what benefits they are getting from their payments. The calculation in this case is budget over impressions.
    <img width="814" alt="CPI" src="https://user-images.githubusercontent.com/47594808/103806412-e682cb00-504c-11eb-94c9-648380f4a845.PNG">

### Cost Per Click
*    Cost per click is similar, it calculates how much the advertiser pays per click. Similarly, this too is extremely important and can be examined under many variables.
    <img width="876" alt="CPC" src="https://user-images.githubusercontent.com/47594808/103806646-3f526380-504d-11eb-8a25-f516012821d0.PNG">

### Cost Per Conversion
*    Finally, cost per conversion calculates how much sales or subscriptions the company makes due to these advertisements, whatever the case may be.
    <img width="893" alt="CPConversion" src="https://user-images.githubusercontent.com/47594808/103806864-86d8ef80-504d-11eb-9e98-19c2b77c5fab.PNG">

### Create index from budget
*    Index was created for budget to keep the format of them the same using id.
     <img width="111" alt="indexfrombudget" src="https://user-images.githubusercontent.com/47594808/103808558-1089bc80-5050-11eb-8fe7-2163288d4b4c.PNG">
    
### Imputation(cpc)
*    From the sample data, the inifinite values were making the data difficult to analyse, substitute with max
    <img width="258" alt="imputation" src="https://user-images.githubusercontent.com/47594808/103808773-68c0be80-5050-11eb-8e89-099dc790c3a5.PNG">
    <img width="142" alt="imputation1" src="https://user-images.githubusercontent.com/47594808/103808915-9dcd1100-5050-11eb-97f1-19507ca16da9.PNG">

### Removed infinite for various analysis purposes (cpc)
*    Substitute the max value of cost per clicks for infinite values, so that some analysis can be done
    <img width="99" alt="submax" src="https://user-images.githubusercontent.com/47594808/103809150-03210200-5051-11eb-8a93-a8884d56ec1e.PNG">

### Plot density (cpc)
*    Plot the density of the distribution for the cost per click with the new data that functions correctly.
    <img width="424" alt="density" src="https://user-images.githubusercontent.com/47594808/103809533-8f332980-5051-11eb-9992-0b0b1e92adf6.PNG">

### Plot density as histogram (cpc)
*    The same plot as above, but this time in different form which may be useful for different analysis.
     <img width="430" alt="Histogram" src="https://user-images.githubusercontent.com/47594808/103809746-de795a00-5051-11eb-930d-c7009113977f.PNG">

### Cumulative probability(emperical cumulative density function)(cpc)
*    Calculates the cumulative probabilities and plots each of them for cost per click.
    <img width="424" alt="cumulative prob plot" src="https://user-images.githubusercontent.com/47594808/103810051-79723400-5052-11eb-855c-c329851f5795.PNG">
    <img width="181" alt="cumulative probability" src="https://user-images.githubusercontent.com/47594808/103810184-b76f5800-5052-11eb-8e6c-fb2e2cd27749.PNG">

### Add cumulative probabilities to table (cpc)
*    Add the calculations made on the cpc on the cumulative probability to the main table. The higher percentage the better result.
    <img width="923" alt="Cumulative in table" src="https://user-images.githubusercontent.com/47594808/103810294-ec7baa80-5052-11eb-8196-43d6b2ae65b5.PNG">

### ggplot for number of companies
*    Returns a plot with the company and count of advertisements for the company.
    <img width="469" alt="plot no of companies" src="https://user-images.githubusercontent.com/47594808/103810418-22b92a00-5053-11eb-9e52-6bd3057dfb49.PNG">

### ggplot for total budget per advertisement
*    Line plot that shows the total budget per advertisment
    <img width="473" alt="budget per advertisement" src="https://user-images.githubusercontent.com/47594808/103810548-55fbb900-5053-11eb-8b2c-2cf3bb0ea77c.PNG">

### Barcharts for campaign
*    Each of the barcharts show the impressions, clicks and conversions count from the campaign
*    Impressions per campaign
    <img width="369" alt="impressions per campaign" src="https://user-images.githubusercontent.com/47594808/103811514-e981b980-5054-11eb-9158-736eaa6a866c.PNG">
*    Clicks per campaign
    <img width="386" alt="clicks per campaign" src="https://user-images.githubusercontent.com/47594808/103811644-22ba2980-5055-11eb-9ae6-9d679c791e54.PNG">
*    Conversions per campaign
    <img width="382" alt="conversions per campaign" src="https://user-images.githubusercontent.com/47594808/103811819-6b71e280-5055-11eb-908d-96fb70bb29fd.PNG">


### Barcharts for advertisement
*    Each of the barcharts show the impressions, clicks and conversions count from the advertisement
*    Impressions per advertisement
    <img width="380" alt="impressions per advertiser" src="https://user-images.githubusercontent.com/47594808/103812363-56498380-5056-11eb-9a03-ef0732d8ef3b.PNG">
*    Clicks per advertisement
    <img width="380" alt="Clicks per advertisement" src="https://user-images.githubusercontent.com/47594808/103812633-b4766680-5056-11eb-93bc-b56b7f171a75.PNG">
*    Conversions per advertisement
    <img width="410" alt="Conversions per advertisement" src="https://user-images.githubusercontent.com/47594808/103812737-e091e780-5056-11eb-9437-d178bcf22378.PNG">
