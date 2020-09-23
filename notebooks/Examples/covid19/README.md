# Corona virus: Fact or Hype
<p align="center">
	<img src="figures/covid-19.jpg" width=500>
</p>


**---UPDATED September 16, 2020---**


# Table of Contents
[1. Introduction](#Introduction)

[2. Definitions](#Definitions)

[3. Data Collection](#Data_Collection)

[4. COVID-19 Analysis](#COVID-19_Analysis)

[5. Comparison to Other Pandemics](#Comparison_to_Other_Pandemics)

[6. SIR Model](#SIR_Model)

[7. R nought](#R_nought)

[8. Bayes Theorem and Coronavirus](#Bayes_Theorem_and_Coronavirus)

[9. P-value](#P-value)

[10. Stock Market Analysis](#Stock_Market_Analysis)

[11. Open for Business?](#Open_for_Business)

[12. Great videos to watch](#Great_videos)

[13. Conclusion](#Conclusion)

[References](#References)



# Preface
We have been tracking this issue for the last 9 months using COVID-19 raw data obtained from the CDC and John's Hopkins. In summary we have found the following:

- **Death toll:** Initially the CDC expected 520,000 deaths in the US; roughly 0.157% of the total US population.  As of September 16, the [death toll is 0.058% of the US population, or 37% of the initial estimates by the CDC](#COVID-19_Analysis) (however, the pandemic is not over yet). 
- **Epidemic:** The [CDC and WHO define an epidemic threshold](#COVID-19_Analysis) as the week when the number of cases surpass 200 per week per 100,000 people.  In the example of California and Texas (the two most populous states), they are 53.7% and 64.3% below epidemic levels respectively, with the week of May 9 being the worst week of new cases.
- **Lock-Down:** Further analysis is needed to see if the lock-down was effective.  [This section](#Open_for_Business_plots) provides nice plots.  Within 3 days of the first detected COVID-19 case, the US stopped all flights from China.  The number of new cases per day were below 100 when the US closed its borders, and a national emergency was declared 2 days later.  The data is so noisy, that it is difficult to determine the effectiveness of the lock-down (California is a good example of noisy data with daily spikes that are double the daily average, ultimately skewing the mean).
- **Re-opening:** Initial analysis of indicates that social distancing and stay-at-home orders are inefective; in particular see the comparison of [California and Texas](#Open_for_Business).  The USA now has a [log-log slope](#log-log_plot) less than the slope for monthly doubling time. This is an indication that the USA, like many countries, has been successful in dramatically slowing the spread of COVID-19.  Also note that many countries have started to re-open and the slope is unchanged after re-opening.  Texas was one of the first states to re-open, and the data suggests that re-opening has little effect on the spread of COVID-19.
- **R0:** CDC initial estimates of the rate of spread, R0, was 2.5-5.  [Current data suggests R0=1.17](#R_nought) (not very contagious), before and during lock-down.  For reference the common flu is R0=0.9-2.1, and measles is R0=12-18 (very contagious).
- **Testing:** [According to multiple studies](#Bayes_Theorem_and_Coronavirus), there are four types of COVID-19 tests.  Of them, the **false-positive rate is 15-45%**.  As more data is collected and testing improves, the CDC anticipates false positive rates similar to other tests, e.g. AIDS testing has a false-positive rate less than 1%.  A recent 2020 study by the premiere science journal [Nature](https://www.nature.com/articles/s41591-020-0843-2) found that the majority of those infected with COVID-19 did not spread the "viral load" regardless of using a face mask.
- **Mental Health:** [According to the literature](#Open_for_Business) on isolation and lock-downs due to epidemics, the secondary effects generally fall into two categories; mental health and economic health.  The [Didi Hirsch Suicide Hotline](https://didihirsch.org/media/recent-coverage/oc-register-suicide-help-hotline-calls-soar-in-southern-california-over-coronavirus-anxieties/) noted an **8000% increase** (that is not a typo) in call volume for March and April, and a significant increase in suicides.  The [National Domestic Violence Hotline](https://www.thehotline.org/help/) noted a 45% increase in calls, and the highest number of domestic violence related deaths in 11 years.
- **Economic Health:** According to a [World Bank study](https://elibrary.worldbank.org/doi/abs/10.1596/1813-9450-5391), 77% debt-to-GDP is the tipping point for an economy prior to recession.  The current [USA debt-to-GDP](https://www.bea.gov/data/gdp/gross-domestic-product) is 110%.
- **Stock Market:** According to [data pulled from 1920-2020](#Stock_Market_Analysis), events of economic decline were always followed by a return.  For example, after the 9/11 attacks, the stock market had a drop for 61 days before returning to pre-9/11 levels.  Similarly, the 2008 Recession took 532 days to recover.  Historical data suggests that the current drop may last several months.
- **Population:** [Current data suggests](#Open_for_Business) that the least COVID-19 affected population is ages 0-18 (so far only 12 child deaths in the US), and the most affected population is 65+ with pre-existing health conditions.  the [65+ age group account for 95% of the COVID-19 deaths](https://www.medrxiv.org/content/10.1101/2020.04.05.20054361v1.full.pdf).
- **Masks:** A 2014 research paper from the British Medical Journal found that loth masks were [less than 3% effective in protecting the individual](https://bmjopen.bmj.com/content/5/4/e006577.short).  As stated in the article, of the 1607 people who participated in the study, for Clinical respiratory illness (CRI), influenza-like illness (ILI) and laboratory-confirmed respiratory virus infection, the ["Penetration of cloth masks by particles was almost 97% and medical masks 44%."](https://bmjopen.bmj.com/content/5/4/e006577.short).  The study also noted the effectiveness of the seal of the mask to the skin on the face of the individual, and discounted the transmission through the eyes. A [2015 study](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4420971/) on the same topic suggests that an N95 mask with a rubber gasket (similar to an industrial painting mask) is the most effective, they state "Laboratory tests showed the penetration of particles through the cloth masks to be very high (97%) compared with medical masks (44%) (used in trial) and 3M 9320 N95 (<0.01%), 3M Vflex 9105 N95 (0.1%)."  The article goes on to state "Conclusions:  This study is the first RCT of cloth masks, and the **results caution against the use of cloth masks**. This is an important finding to inform occupational health and safety. **Moisture retention, reuse of cloth masks and poor filtration may result in increased risk of infection.** Further research is needed to inform the widespread use of cloth masks globally. However, as a precautionary measure, cloth masks should not be recommended for HCWs, particularly in high-risk situations, and guidelines need to be updated." The WHO provided further guidance in April 2020 ([here](https://apps.who.int/iris/handle/10665/331693) and [here](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwjE_cCygO_rAhUHHqwKHfCMA_gQFjACegQIBBAB&url=https%3A%2F%2Fapps.who.int%2Firis%2Frest%2Fbitstreams%2F1279750%2Fretrieve&usg=AOvVaw3OEk7GblHnLXwd5oEzXFJ1) ) stating "There is limited evidence that wearing a medical mask by healthy individuals in  households,  in  particular  those  who  share  a  house  with  a  sick person, or among attendees of mass gatherings may be beneficial  as  a  measure  preventing  transmission."  A recent 2020 study by the premiere science journal [Nature](https://www.nature.com/articles/s41591-020-0843-2) found that the majority of those infected with COVID-19 did not spread the "viral load" in exhaled breath regardless of using a face mask.  In fact the viral load in exhaled breath was so low, among those who tested positive, as to be "undetectable" during a 30 minute test in a laboratory environment with exceptionally sensitive equipment.  The [CDC](https://wwwnc.cdc.gov/eid/article/26/10/20-0948_article) updated its guidance stating that recent studies of cloth masks "may prevent" transmission of viruses, but did not quantify their results.


**Note from the authors:** This analysis is based on the study of data science and machine learning applied to open-source raw data. We are not health professionals or epidemiologists, we are mathematicians and statisticians.  In the last 9 months we have worked with world-class epidemiologists to assist them with the math and statistics.  Our theoretical analysis is based on journal papers and articles on infectious diseases, mental health, criminal behavior, and economics.  Our practical analysis is based on conversations and collaboration with experts in epidemiology, law enforcement, mental health, and economics.  This article should not be interpreted as professional advice.  All references are provided as hyperlinks.


**If you are concerned that you may have contracted COVID-19**, you can take an **online screening test** created by [Apple in collaboration with the CDC](https://www.apple.com/covid19).  

You can get the latest information for the USA at [coronavirus.gov](https://www.coronavirus.gov/).


# 1. Introduction <a name="Introduction"/>
At the time of the writing of this notebook, the world has descended into mass panic, fueled by misinformation in media and social media.  Unfortunately, both fact and hype exist in discussions regarding COVID-19.  This notebook will consider data publically available from the Centers for Disease Control and Prevention (CDC) [[1](https://www.cdc.gov/coronavirus/2019-ncov/index.html)]  and World Health Organization (WHO) [[2](https://www.who.int/csr/don/12-january-2020-novel-coronavirus-china/en/)].  **As Data Scientists, it is our job to analyze data to help others make informed data-driven decisions.**





# 2. Definitions <a name="Definitions"/>

Definitions as defined by the CDC [[1](https://www.cdc.gov/coronavirus/2019-ncov/index.html)].  

## 2.1 Epidemic <a name="Definition-Epidemic"/>
The epidemic threshold is reached if the [number of cases surpass](https://bmcmedicine.biomedcentral.com/articles/10.1186/1741-7015-6-16) [200 cases per week per 100,000 people](https://www.healthknowledge.org.uk/public-health-textbook/research-methods/1a-epidemiology/epidemic-theory).

## 2.2 Corona Virus
- Coronaviruses are zoonotic viruses (transmitted between animals and people).
- Symptoms include: fever, cough, respiratory symptoms, and breathing difficulties.
- In severe cases, it can cause pneumonia, severe acute respiratory syndrome (SARS), kidney failure and even death.
- Coronaviruses are also asymptomatic, meaning a person can be a carrier of the infection but experience no symptoms.

## 2.3 Novel coronavirus (nCoV)
- A novel coronavirus (nCoV) is a new strain that has not been previously identified in humans.

## 2.4 COVID-19 (Corona Virus Disease 2019)
- Caused by a SARS-COV-2 corona virus.
- First identified in Wuhan, Hubei, China. Earliest reported symptoms reported in November 2019.
- On January 30, 2020 the WHO declared the outbreak to be a Public Health Emergency of International Concern [[2](https://www.who.int/csr/don/12-january-2020-novel-coronavirus-china/en/)].





# 3. Data Collection <a name="Data_Collection"/>
So is COVID-19 really a pandemic? If so, how does it compare to other pandemics?  According to the CDC [[1](https://www.cdc.gov/coronavirus/2019-ncov/index.html)], COVID-19 **may** be 10x worse than the common flu, though some people will contract COVID-19 and have little to no symptoms whatsoever.

In 2017, [Dr. Anthony Fauci](https://www.niaid.nih.gov/news-events/director-in-the-news?page=9) warned of a pandemic in his [speech at Georgetown university](https://gumc.georgetown.edu/gumc-stories/global-health-experts-advise-advance-planning-for-inevitable-pandemic/#) based on his [research](https://alatorax.org/index.php/pt/descargar/adjunto/387_0i2FZP_novel-vaccine-technologies.pdf).

A recent article by Dr. Anthony Fauci, et.al., states that the COVID-19 models are very conservative, and the COVID-19 **mortality rate is considerably less than initial predictions** [[3](https://www.nejm.org/doi/full/10.1056/NEJMe2002387)].

If you are reading this notebook, you realize that you are more than a lay-person.  You have powerful tools at your fingertips ([Data Science](https://github.com/dsbc2020/ml_training/tree/master/notebooks/10-steps-to-DS), [Python](https://github.com/dsbc2020/ml_training/tree/master/notebooks/Python-in-2-days), and [Machine Learning](https://github.com/dsbc2020/ml_training/tree/master/notebooks/Machine-Learning-in-1-day)), and you likely have access to the [Coronavirus raw data](https://github.com/CSSEGISandData/COVID-19) so that you can analyze and formulate your own opinion.  You realize that to be a Data Scientist requires you to be a creative and critical thinker... an individual.

Team DSBC had the same notion!

So we collected data from the CDC and WHO websites.  But we didn't stop there.  We are critical thinkers too.  We also collected data for:
- Wuhan Institute of Virology publications [2016](https://link.springer.com/article/10.1007/s12250-016-3713-9), [2017](https://onlinelibrary.wiley.com/doi/full/10.1111/zph.12358), [2018](https://link.springer.com/article/10.1007/s12250-018-0012-7), [2019](https://www.nejm.org/doi/full/10.1056/NEJMoa2001316)
- National institute of Allergy & Infectious Diseases [funding](https://taggs.hhs.gov/Detail/AwardDetail?arg_AwardNum=R01AI110964&arg_ProgOfficeCode=104), and [research of coronavirus](https://www.niaid.nih.gov/diseases-conditions/coronaviruses)
- The COVID Tracking Project [[4](https://covidtracking.com/)]
- Coronavirus international incidence dates [[5](https://www.washington.edu/news/2020/02/07/interactive-map-shows-worldwide-spread-of-coronavirus/)]
- JHU Data sources [[6](https://github.com/CSSEGISandData/COVID-19)], [[7](https://github.com/imdevskp/covid_19_jhu_data_web_scrap_and_cleaning)]
- 2009 H1N1 Swine Flu [[8](https://academic.oup.com/cid/article/52/suppl_1/S75/499147#97947460)], [[9](https://www.cdc.gov/flu/spotlights/pandemic-global-estimates.htm)], [[10](http://www.cidrap.umn.edu/news-perspective/2011/08/study-puts-global-2009-h1n1-infection-rate-11-21)], [[11](https://www.cdc.gov/flu/pandemic-resources/2009-pandemic-timeline.html)], [[12](https://en.wikipedia.org/wiki/2009_flu_pandemic_timeline#March_2009)]
- Ebola [[13](https://www.cdc.gov/vhf/ebola/history/2014-2016-outbreak/case-counts.html)]
- SARS [[14](https://www.who.int/csr/sars/country/en/)]
- MERS [[15](https://hazards.colorado.edu/quick-response-report/dynamics-of-interorganizational-risk-management-networks-during-the-2015-mers-response-in-south-korea)]
- 1918 Spanish Flu [[16](https://www.cdc.gov/flu/pandemic-resources/1918-commemoration/pandemic-timeline-1918.htm)], [[17](https://wwwnc.cdc.gov/eid/article/12/1/05-0979_article)]


Just for completeness, we also collected data on:
- Stock Prices: DJIA [[18](https://www.wsj.com/market-data/quotes/index/DJIA/historical-prices)], NASDAQ [[19](https://www.wsj.com/market-data/quotes/index/COMP/historical-prices)], and the S&P 500 [[20](https://www.wsj.com/market-data/quotes/index/SPX/historical-prices)]
- Car crashes [[21](https://www.asirt.org/safe-travel/road-safety-facts/)]
- Suicides [[22](https://www.who.int/mental_health/prevention/suicide/suicideprevent/en/)]
- Cancer [[23](https://www.who.int/news-room/fact-sheets/detail/cancer)]
- Ischemic Heart Disease [[24](https://www.ahajournals.org/doi/10.1161/CIRCOUTCOMES.118.005375)]
- Generic US Flu [[25](https://www.cdc.gov/flu/about/burden/preliminary-in-season-estimates.htm)]
- Stroke [[26](http://www.strokecenter.org/patients/about-stroke/stroke-statistics/)]
- Drowning [[27](https://www.who.int/news-room/fact-sheets/detail/drowning)]
- Bed strangulation [[28](https://www.businessinsider.com/weird-causes-of-death-2016-7#w75-accidental-suffocation-and-strangulation-in-bed--10206-deaths-7)], [[29](https://wonder.cdc.gov/controller/datarequest/D76)]
- SIDS [[30]](https://pediatrics.aappublications.org/content/pediatrics/122/3/660.full.pdf?download=true)]
- Domestic Violence [[31](https://www.npr.org/sections/goatsandsoda/2018/11/30/671872574/u-n-report-50-000-women-a-year-are-killed-by-intimate-partners-family-members)]
- Animal deaths [[32](https://www.businessinsider.com/worlds-deadliest-animals-2016-9/)]
- Alzheimer's [[33](https://braintest.com/alzheimers-statistics-throughout-the-united-states-and-worldwide/)]
- Malaria [[34](https://www.childfund.org/infographic/malaria/)]
- Homicide [[35](https://ourworldindata.org/homicides)]







# 4. COVID-19 Analysis <a name="COVID-19_Analysis"/>

## 4.1 Background

The CDC estimates [[36](https://www.cdc.gov/coronavirus/2019-ncov/index.html)] that COVID-19 will be 10 times more deadly than the common flu.  This means that if the common flu related deaths is 52,000 for the USA in 2020, the expected number of deaths for COVID-19 is 520,000.  If the US population in the year 2020 is 329,227,746 people [[37](https://www.census.gov)], the percent of the population that will likely die of COVID-19 is 0.16% (roughly 16 in every 10,000 people):

	(520,000 / 329,227,746) * 100 = 0.157%
	
The current death percent of population (September 16, 2020) is 0.058% (roughly 6 in every 10,000 people):
	
	(194,071 / 329,227,746) * 100 = 0.058%
	
Compare this to [other epidemics](#Averages).

**According to the CDC, epidemics like the Coronavirus initially follow an exponential growth model**, then reach an inflection point, before subsiding.  The curve (called a Sigmoid function) looks like this:
<p align="center">
	<img src="figures/sigmoid.png" width=400>
</p>
This model can be expressed mathematically as

	f(x) = 1 / (1 + exp(-x)).  
	
To track the epidemic in real-time, the CDC does not track the total number of deaths, rather they track the rate of change, i.e. the first derivative of the sigmoid  

	f'(x) = f(x) * (1 - f(x)).  

This means that **the CDC track the slope (or rate of change) of the Sigmoid.**  When the rate of change decreases, the inflection point has passed and the "end is in sight."  Effectively, you could estimate the total number of deaths by doubling the number of deaths prior to the inflection point.

If you are still having trouble with this Sigmoid concept, watch this great [YouTube video](https://youtu.be/Kas0tIxDvrg).


## 4.2 Daily Plots
Daily plots of **new cases** is another great method to determine speed at which a virus spreads.  A drop in the curve (e.g. USA) indicates that the virus is not spreading as quickly and the end may be in sight.
<p align="center">
	<img src="figures/daily_confirmed_cases_global.png" width=800>
</p>
<p align="center">
	<img src="figures/daily_deaths_global.png" width=800>
</p>
<p align="center">
	<img src="figures/daily_new_cases.png" width=800>
</p>
<p align="center">
	<img src="figures/daily_deaths.png" width=800>
</p>


## 4.3 Mortality Rate
Number of tests in each country versus the mortality rate for that country.
<p align="center">
	<img src="figures/num_tests_vs_mortiality_rate_vs_country.png" width=600>
</p>

The mortality rate for each country versus the test positive rate.  For example, 95.16% of the population that tested positive in the USA had a mortality rate of 2.9%.  Note for some countries there is a discrepancy in the reported population and the reported number of tests positive.  This could be the result of some people taking multiple tests.
<p align="center">
	<img src="figures/mortiality_rate_vs_test_positive_vs_country.png" width=600>
</p>


## 4.4 Log-Log Plots <a name="log-log_plot"/>
Log-Log plots are a better form with which to look at data, specifically epidemics and the "doubling" time or spread of a virus.  A doubling is indicated by a straight line, where the slope indicate the number of days for doubling, whereas a curve to the right indicates a slowing of the spread of the virus.  We have provided "doubling" lines, at various rates, and curves for top 10 countries (with the most cases).  

**Note that the USA now has a slope less than the slope for monthly doubling time.** This is an indication that the USA, like many contries, has been successful in dramatically slowing the spread of COVID-19.  **Also note that many countries have started to re-open and the slope is unchanged after re-opening.**


<p align="center">
	<img src="figures/log_log_worldwide_cases.png" width=600>
</p>
<p align="center">
	<img src="figures/log_log_worldwide_deaths.png" width=600>
</p>
<p align="center">
	<img src="figures/log_world_trend.png" width=800>
</p>


## 4.5 Maps - World
Confirmed cases by country
<p align="center">
	<img src="figures/covid_19_worldwide_confirmed.png" width=600>
</p>

Deaths by country
<p align="center">
	<img src="figures/covid_19_worldwide_deaths.png" width=600>
</p>


## 4.6 Maps - USA 
Confirmed cases by state
<p align="center">
	<img src="figures/covid_19_usa_confirmed.png" width=600>
</p>

Deaths by state
<p align="center">
	<img src="figures/covid_19_usa_deaths.png" width=600>
</p>

Confirmed cases by county
<p align="center">
	<img src="figures/covid_19_usa_confirmed_by_county.png" width=600>
</p>

Confirmed Cases by County: Heat Map
<p align="center">
	<img src="figures/covid_19_usa_confirmed_by_county_heatmap.png" width=600>
</p>


## 4.7 Block Chart
The size of the *overall block* represents the *total of all countries/states*.  The size of *each block* represents the number of cases/recovered/deaths in that *country/state*.
<p align="center">
	<img src="figures/covid_19_block_chart_confirmed.png" width=600>
</p>
<p align="center">
	<img src="figures/covid_19_block_chart_deaths.png" width=600>
</p>
<p align="center">
	<img src="figures/covid_19_block_chart_recovered.png" width=600>
</p>

<p align="center">
	<img src="figures/covid_19_block_chart_usa_confirmed.png" width=600>
</p>
<p align="center">
	<img src="figures/covid_19_block_chart_usa_deaths.png" width=600>
</p>












# 5 Comparison to Other Pandemics <a name="Comparison_to_Other_Pandemics"/>
So how does COVID-19 compare to other pandemics?  Here is a comparison of COVID-19, Ebola and SARS.  Colors (yellow to purple) indicate the number of confirmed cases.  Clearly COVID-19 is much more wide-spread.  Note that this might have some relation to the increased global ability to test, track and confirm viruses in 2020 compared to 2003.


## 5.1 Comparison of Cases
<p align="center">
	<img src="figures/covid19_ebola_sars_cases_1.png" width=600>
</p>
<p align="center">
	<img src="figures/covid19_ebola_sars_cases_2.png" width=600>
</p>
<p align="center">
	<img src="figures/covid19_ebola_sars_cases_3.png" width=600>
</p>


## 5.2 Comparison of Deaths
<p align="center">
	<img src="figures/covid19_ebola_sars_deaths_1.png" width=600>
</p>
<p align="center">
	<img src="figures/covid19_ebola_sars_deaths_2.png" width=600>
</p>
<p align="center">
	<img src="figures/covid19_ebola_sars_deaths_3.png" width=600>
</p>


## 5.3 Bar Chart Comparisons
<p align="center">
	<img src="figures/comparison_num_countries.png" width=600>
</p>

<p align="center">
	<img src="figures/comparison_mortality_rate.png" width=600>
</p>

<p align="center">
	<img src="figures/comparison_num_cases.png" width=600>
</p>

<p align="center">
	<img src="figures/comparison_num_deaths.png" width=600>
</p>


## 5.4 Averages <a name="Averages"/>
The following is the number of *DEATHS PER DAY ON AVERAGE* from the links above.
- Cancer = 26,302
- Heart Disease = 24,658
- Diabetes = 3,753
- Car accidents = 3,287
- Suicides= 3,000
- HIV AIDS = 2,615
- Alzheimer = 1,918
- COVID-19 = 1,844
- Malaria = 1,200
- Homicide = 1,111
- Drowning = 877
- Alcohol_disorder = 507
- Fire = 331
- Stroke = 384 (USA only)
- Common Flu = 143 (USA only)
- Domestic Violence = 137
- Bed strangulation = 28 (USA only)
- Natural disasters= 26
- SIDS = 7


The result of *WORLD-WIDE DEATHS PER DAY* is shown here.    

<p align="center">
	<img src="figures/death_by_other.png" width=600>
</p>

Here is another plot showing the top causes of *death per YEAR*.
<p align="center">
	<img src="figures/annual_disease_deaths.png" width=800>
</p>




# 6. SIR Model <a name="SIR_Model"/>
Applying the models found in the literature [38],[39],[40] we can evaluate the spread of a virus by splitting the population into three categories, *Susceptible*, *Infected*, and *Recovered*.  Then using a partial differential equation (recall your calculus), we can solve the rate of change of each category. Our Matlab analysis can be found [here](https://github.com/dsbc2020/ml_training/tree/master/notebooks/Examples/coronavirus/matlab/SIR_model).

The weights (or constants) are the Transmission Rate (CDC example: a = 3.2), and Recovery Rate (CDC example: b = 0.23).

The Susceptible Equation, meaning the rate at which the Susceptible population is affected over time:

	ds/dt = -a * s(t) * i(t)

The Recovered Equation, meaning the rate at which the Recovered population is affected over time: 

	dr/dt = b * i(t)

The Infected Equation, meaning the rate at which the Infected population is affected over time. First we know that the three partial derivatives must balance each other, meaning the equations depend on each other and together cannot exceed 100% of the population:

	ds/dt + di/dt + dr/dt = 0

therefore,

	di/dt = a * s(t) * i(t) - b * i(t)

We can then evaluate the equations with various weights, first consider the case where we hold the Recovery Rate fixed. Notice that if the Transmission Rate is low (a=0.5), the Susceptible population never reaches 0, meaning that the entire population is not affected by the virus, only a portion of it.  Conversely, if the Transmission Rate is high (a=3.2, as expected by the CDC for COVID-19) then the entire population is affected.  The logical solution to reduce Transmission Rate is to reduce the interactions within the population.
<p align="center">
	<img src="matlab/SIR_model/covid-19_model_Figure_1.png" width=600>
</p>

Now consider the case if we hold the Transmission Rate fixed, and vary the Recovery Rate.  If the Recovery Rate is low (ex: b=0.23), the Infected Population is prolonged in time.  Whereas if the Recovery Rate is high (ex: b=0.95), the Infected Population is reduced in time and the Susceptible Population never reaches 100%.  Notice that for b=0.95, the Recovered Population never reaches 1, this is because the Susceptible Population never reaches 0.
<p align="center">
	<img src="matlab/SIR_model/covid-19_model_Figure_2.png" width=600>
</p>









# 7. R nought <a name="R_nought"/>
The reproduction number, R0 for short, describes how many additional cases of a disease each infected person will cause during their infectious period. The numbers are a range, because they depend on a variety of factors that vary from situation to situation.
<p align="center">
	<img src="figures/common_R0_values.png" width=600>
</p>
The CDC has estimated the COVID-19 R0 to be somewhere between 1.5 and 3.5. Most modeling simulations that project future cases are using R0's in that range [48].  

This means that a person with COVID-19 may infect between 1.5 and 3.5 people. 

Now lets consider the R0 model,  
	
	R0 = n / p

where n = number of new cases, and p = number of prior cases.  

We can perform a rough simulation to derive the R0 value for New York City (NYC), where the current number of cases is 291,996 (as of April 28, 2020). Using the CDC data we find that the first confirmed case was February 10th.  The number of days from Feb 10 to April 8 is 78 days.  Simulating the R0 model we find that for NYC the R0 = 1.17. Note: the seasonal flu is 0.9-2.1.  Our Matlab analysis can be found [here](https://github.com/dsbc2020/ml_training/tree/master/notebooks/Examples/coronavirus/matlab/R0_model).
<p align="center">
	<img src="matlab/R0_model/R0_model_Figure_1.png" width=600>
</p>
<p align="center">
	<img src="matlab/R0_model/R0_model_Figure_2.png" width=600>
</p>







# 8. Bayes Theorem and Coronavirus <a name="Bayes_Theorem_and_Coronavirus"/>

## 8.1 Introduction
Mark Twain stated
<p align="center">
	<img src="figures/lies.png" width=400>
</p>

So how does this apply to the Coronavirus?  As with most medical testing, **no test is 100% accurate** [[49](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3121570/)].  Such is the case for COVID-19 testing.  Our Matlab analysis can be found [here](https://github.com/dsbc2020/ml_training/tree/master/notebooks/Examples/coronavirus/matlab/Bayes_Theorem). 

According to the CDC "The CDC 2019-nCoV Real-Time RT-PCR Diagnostic Panel has been **designed to minimize the likelihood of false positive test results**." ... "A negative test result for this test means that SARS-CoV-2 RNA was not present in the specimen **above the limit of detection**. However, a negative result does not rule out COVID-19 and should not be used as the sole basis for treatment or patient management decisions." [[50](https://www.fda.gov/media/134920/download)]

Notice the language used; **"minimize the likelihood"** and **"limit of detection"**, indicating that the test is not a 0% or 100%, rather it is a likelihood.

Initial research indicates that COVID-19 "sputum sample showed the highest positive rate in both severe (88.9%) and mild (82.2%) cases, follow by nasal swabs (73.3%, 72.1%) and then the throat swabs (60.0%, 61.3%)" [[51](https://www.medrxiv.org/content/10.1101/2020.02.11.20021493v2.full.pdf)].  Also note their tests use a p-value < 0.05 (we will use this in a moment).


Consider an example: assume you take the COVID-19 test, and the test result is 98% positive (you have COVID-19), this means that there is a 2% chance you don’t have COVID-19.  However, given the overwhelming evidence (remember 98% positive), the doctor will say that you have COVID-19.  This results in a **false positive** rate of 2% (in our example).

How might our false positive example translate to the USA population?  

According to the CDC, 60% of the USA population (197,536,648 people) will contract COVID-19 [[52](https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/summary.html#anchor_1582494216224)].  This means that at 2% (in our example), there are 3,950,733 people with tests that are false positives. Therefore 4 million people, who don’t have COVID-19, will receive medical care for a virus they don’t have.  What is the impact to medical facilities and personnel, and the metal stability of those 4 million people?

So why are the COVID-19 tests not 0% or 100%?  The answer involves [Bayesian Statistics](#Bayes_Theory), [probabilities](#False_positives) and [p-value](#P-value).



## 8.2 True Positives vs. False Positives <a name="False_positives"/>
In hypothesis testing there are four distinct scenarios, for a particular test outcome, with respect to a specific person.
- You may be really infected, and the test says ‘YES’. This is called a **TRUE POSITIVE (TP)**.
- You may not be infected, but still, the test says ‘YES’. This is called a **FALSE POSITIVE (FP)**.
- You may not be infected, and the test says ‘NO’. This is called a **TRUE NEGATIVE (TN)**.
- You may be really infected, but the test says ‘NO’. This is called a **FALSE NEGATIVE (FN)**.

We can calculate a number of useful metrics from just the four numbers,
<p align="center">
	<img src="figures/accuracy.png" width=400>
</p>
<p align="center">
	<img src="figures/sensitivity.png" width=400>
</p>

As data science practitioners, you should be empowered to know that the same tools that you use in your ML algorithms or statistical modeling, are utilized for measuring the success of mission-critical medical testing and public health systems. You can simply assign different costs to each of these metrics and tune the test or algorithm to minimize the overall cost.


## 8.3 Bayes Theory for COVID-19 <a name="Bayes_Theory"/>
Bayes’ theorem is the most powerful rule of probability theory. It describes the probability of an event, based on prior knowledge of conditions that might be related to the event.
<p align="center">
	<img src="figures/bayes.png" width=400>
</p>

Bayes’ theorem lets us begin with a hypothesis and a certain degree of belief in that hypothesis, based on prior knowledge (or domain expertise). Thereafter, we gather data and update our initial beliefs. If the data support the hypothesis then the probability increases, if it does not match, then probability decreases.  In medical testing this is similar to seeing a second opinion from a doctor about the diagnosis of a disease.

**Summary: Bayes' prediction accuracy increases with more data.**

If we write the testing process in terms of probability, then:

**P(COVID-19 positive| test = positive)**: From Bayes’ this is the posterior conditional probability, P(A|B). This is read as "the probability that the individual has COVID-19, given, the test result is positive". .

**P(test = positive|COVID-19 positive)**: This is the prior probability, P(B|A). This is the sensitivity, i.e. how many true positives (test results) are there among all true positive cases.

**P(COVID-19 positive)**: This is the probability of a randomly selected individual infected by COVID-19. In medical testing, this is called the "prevalence rate". For COVID-19, experts say the general prevalence rate is 0.1%, i.e. 1 out of 1000 people may be infected with the virus. Of course, this number can change based on the country, health system, active social distancing measure, etc. This term appears in the numerator of the Bayes’ rule ( P(A) in the Bayes’ rule).

**P(test=positive)**: This is the probability of a randomly selected test being positive, P(B), calculated as,

	P(test=positive) = P(test=positive|COVID-19 positive) x P(COVID-19 positive) + P(test=positive|COVID-19 negative) x P(COVID-19 negative)

**P(test=positive|COVID-19 negative)** is the FALSE POSITIVE rate.






# 9. P-value <a name="P-value"/>
In hypothesis testing, assuming the null hypothesis is correct, the probability value (p-value) is the probability that the test result is as extreme as the results actually observed.  

For example, assume that a city claims that COVID-19 has infected 20% of the population.
- Null hypothesis: The mean population infected is 20% or less.
- Alternate hypothesis: The mean population infected is greater than 20%. 

We’ll use one-tailed test in our case since we only care if the mean population infected is greater than 20%. We’ll disregard the possibility in the other direction since the consequences of having a mean infection lower or equal to 20% is even more preferable.

Since we are testing something that is occurring in nature, it is common to assume a Normal (Gaussian) distribution.
<p align="center">
	<img src="figures/gaussian_distribution.png" width=600>
</p>
The mean is the central tendency of the distribution. It defines the location of the peak for normal distributions. The standard deviation is a measure of variability. It determines how far the values tend to deviate from the mean.

The normal distribution is commonly associated with the 68-95-99.7 rule.
- 68% of the data is within 1 standard deviation (σ) of the mean (μ)
- 95% of the data is within 2 standard deviations (σ) of the mean (μ)
- 99.7% of the data is within 3 standard deviations (σ) of the mean (μ)

The job of p-value is to answer this question:

"If I’m living in a city where the mean population infected is 20% or less (null hypothesis is true), how surprising is my evidence based on my data?

P-value answers this question with a number - **probability**.

**The lower the p-value, the more surprising the evidence is, and the more ridiculous our null hypothesis looks.** What do we do when we feel ridiculous with our null hypothesis? We reject that and choose our alternative hypothesis instead.

If the p-value is lower than a predetermined significance level (in the literature this is called "alpha"), then we reject the null hypothesis.

Returning to our example: After you collect some data, you perform the calculation to find that the infected population is 25% with a p-value=0.03.  This means that in a city where the infected population is 20% or less, there is a 3% chance that the infected population is 25%, due to random noise in your samples. The lower the p-value, the more meaningful the result, because it is less likely to be caused by noise.

The following image illustrates this example for a test with a p-value=0.05.
<p align="center">
	<img src="figures/p-value.png" width=600>
</p>

There’s a common misinterpretation of p-value for most people in our case: "the p-value=0.03 means that there’s 3% (probability in percentage) that the result is due to chance" - which is not true. P-value is just a value (3% in our example) with which to make a reasonable decision about our data collection and its distribution with regard to the mean. 

If, after analyzing the sample data collected, the p-value of 0.03 is lower than the significance level of 0.05 (assume that we set this before our experiment), and we can say that the result is *statistically significant*.

P-value is not enough, we need to set a threshold (the significance level — alpha). The alpha should always be set before an experiment to avoid bias. If the observed p-value is lower than alpha, then we conclude that the result is statistically significant.

The rule of thumb is to set alpha to be either 0.05 or 0.01 (again, the value depends on your problems at hand), meaning that observed p-values lower than 95% or 99% are *statistically significant*.

P-value can be confusing. Fortunately, we have Python and NumPy to do the math for us.  You can now use this method to select your threshold value (alpha) and your p-value (significance test) along with the COVID-19 data for any city, and make a reasonable decision about our data collection and its distribution with regard to the mean.









# 10. Stock Market Analysis <a name="Stock_Market_Analysis"/>
During times of crisis, the stock market tends to be volatile.  Many people panic and consider liquidating their 401k and other investment accounts. As Data Scientists we have data to evaluate.  We pulled data from the following:
- Dow Jones Industrial Average: [[18](https://www.wsj.com/market-data/quotes/index/DJIA/historical-prices)], [[41](https://www.macrotrends.net/1319/dow-jones-100-year-historical-chart)]
- NASDAQ: [[19](https://www.wsj.com/market-data/quotes/index/COMP/historical-prices)], [[42](https://www.macrotrends.net/1320/nasdaq-historical-chart)]
- S&P 500: [[20](https://www.wsj.com/market-data/quotes/index/SPX/historical-prices)], [[43](https://www.macrotrends.net/2324/sp-500-historical-chart-data)]
 
The figure below provides the daily closing values for DJIA, S&P 500, and NASDAQ from 03/20/2000 to 03/20/2020.  Notice that after the 9/11 attacks in 2001, the market recovered in 61 days (just before Christmas).  After the 2008 Recession, the market recovered in 532 days (1 year, 5 months).  **In all cases the market recovered**, so take a moment and reflect before you consider liquidating your retirement accounts and investments. Our Matlab analysis can be found [here](https://github.com/dsbc2020/ml_training/tree/master/notebooks/Examples/coronavirus/matlab/Stock_Market_Analysis).

<p align="center">
	<img src="matlab/Stock_Market_Analysis/stock_recovery.png" width=600>
</p>






# 11. Open for Business? <a name="Open_for_Business"/>
When should a country or a state consider opening for business?  Many people are concerned with the primary effects of COVID-19, namely the possibility of an increased number of COVID-19 deaths if countries or states open too soon.  However what are the secondary effects of COVID-19, and what are the possible issues related to quarantine? Are there other factors that maybe we should consider that are more lethal than COVID-19?  Let’s look at the data for a few data points to compare and contrast this issue.


## 11.1 COVID-19 Secondary affects

### 11.1.1 Mental Health
The [New England Journal of Medicine](https://www.nejm.org/doi/full/10.1056/NEJMp2008017) notes that quarantine often increases problems related to mental health. 
- The [American Psychiatric Association](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=4&ved=2ahUKEwjcvqX8z4zpAhUCSq0KHd2zC1sQFjADegQIBRAB&url=https%3A%2F%2Fwww.psychiatry.org%2FFile%2520Library%2FPsychiatrists%2FAdvocacy%2FFederal%2FMental-Health-2020-A-Presidential-Initiative-for-Mental-Health.pdf&usg=AOvVaw3D_fCutRhha_75XDfvPjlD) notes that 47 million Americans (1 in 5 adults) suffer from mental health issues.   
- The [Didi Hirsch Suicide Hotline](https://didihirsch.org/media/recent-coverage/oc-register-suicide-help-hotline-calls-soar-in-southern-california-over-coronavirus-anxieties/) published a call volume increase of 8,000% (that is not a typo!) from February 2020 to March 2020, with a precipitous increase in actual suicides over last year.  An 8,000% increase is statistically significant!  
- The [National Domestic Violence Hotline](https://www.thehotline.org/help/) noted a significant increase in call volume in March and April 2020.  The [BBC](https://www.bbc.com/news/uk-52433520) noted an increase of domestic abuse calls of 49%, and the highest number of domestic abuse deaths in 11 years.  The [National Coalition Against Domestic Violence](https://ncadv.org/statistics) (NCADV) noted that on average, nearly 20 people per minute are physically abused by an intimate partner in the United States. 

### 11.1.2 Economic Stability: Debt-to-GDP
What are the risks of closing business, decreasing Gross Domestic Product (GDP) and increasing debt through stimulus packages?  What is the breaking point for an economy, and what are the early signs of a recession or collapse?  
- According to a [World Bank study](https://elibrary.worldbank.org/doi/abs/10.1596/1813-9450-5391) the tipping point for any economy is 77% debt-to-GDP.
- The current [USA debt](https://www.treasurydirect.gov/NP/debt/current) is $24.8 trillion.
- The current [USA debt-to-GDP](https://www.bea.gov/data/gdp/gross-domestic-product) ratio is 110%.

A debt-to-GDP of 110% is statistically significant!


## 11.2 Examples and Counter-Examples

It may be helpful to consider the two most populous states, one that remains in lock-down (as of May 13, 2020) and the other that has re-opened.  
- Is there a spike in the number of cases after opening?  If so, this would indicate that re-opening is premature?  
- Is there a continued growth in the number of cases during lock-down?  If so, this might indicate that the lock-down is ineffective.

### 11.2.1 California 
California remains in partial lock-down  (as of September 16, 2020).  

California has a population of 39,512,223 people, and a COVID-19 death toll of 5,076 people, or 0.012 % of the population. Compare this to:
- [Seasonal flu](https://www.cdph.ca.gov/Programs/CID/DCDC/CDPH%20Document%20Library/Immunization/Week2019-2011_FINALReport.pdf): (658/39,512,223)*100 = 0.001% of the population.
- [Fatal car accidents](https://www.iihs.org/topics/fatality-statistics/detail/state-by-state): (3,563/39,512,223)*100 = 0.009% of the population.  
- [Suicides](https://www.cdc.gov/nchs/pressroom/sosmap/suicide-mortality/suicide.htm): (4,491/39,512,223)*100 = 0.011% of the population. 

**In California there are nearly as many deaths due to car accidents and suicides than deaths related to COVID-19.**

Based on the definition of an [epidemic](#Definition-Epidemic), does California fit the definition?
 - An epidemic is defined as "200 cases per week per 100,000 people" (by the [scientific definition](#Definition-Epidemic)). Based on the population of California, there should be 79,024 cases per week to be epidemic levels for the entire state: (39,512,223/100,000)*200 = 79,024.
 - Over an 26 week period (January-June 2020) California has a total of 70,978 cases (total, not 70,978 per week).
 - The weekly maximum cases in California was 18,298 cases for the week ending 6/11/2020.  By [definition](#Definition-Epidemic) **California is 53.7% below epidemic levels.** (100-(18,298/(39,512,223/100,000))) = 53.7% below epidemic levels)

### 11.2.2 Texas
Texas has re-opened with a staggered process of roughly 25% per week  (as of September 16, 2020).

Texas has a population of 28,995,881 people, and a COVID-19 death toll of 1,971 people, or 0.006 % of the population.  Compare this to:
- [Seasonal flu](https://www.dshs.state.tx.us/IDCU/disease/influenza/surveillance/2019-2020.aspx): (6,737/28,995,881)*100 = 0.023% of the population.
- [Fatal car accidents](https://www.iihs.org/topics/fatality-statistics/detail/state-by-state): (3,642/28,995,881)*100 = 0.012% of the population.  
- [Suicides](https://www.cdc.gov/nchs/pressroom/sosmap/suicide-mortality/suicide.htm): (3,930/28,995,881)*100 = 0.013% of the population. 

**In Texas there are 4 times more deaths due to flu, and 2 times more suicides than deaths related to COVID-19.**

Based on the definition of an [epidemic](#Definition-Epidemic), does Texas fit the definition?
 - An epidemic is defined as "200 cases per week per 100,000 people" (by the [scientific definition](#Definition-Epidemic)). Based on the population of Texas, there should be 57,991 cases per week to be epidemic levels for the entire state: (39,512,223/100,000)*200 = 57,991.
 - Over an 26 week period (January-June 2020) Texas has a total of 86,915 cases (total, not 86,915 per week).
 - The weekly maximum cases in Texas was 10,335 cases for the week ending 6/11/2020.  By [definition](#Definition-Epidemic)  **Texas is 64.3% below epidemic levels with no apparent spike after re-opening.** (100-(10,335/(28,995,881/100,000))) = 64.3% below epidemic levels)
 
### 11.2.3 Plots <a name="Open_for_Business_plots"/>
Here we can compare California and Texas with the cumulative cases, as well as the new cases and deaths each week.  
Note the number of new cases is still below the threshold for an epidemic, and is also below the levels of seasonal flu, which **is** annually classified as an epidemic in the USA.
<p align="center">
	<img src="matlab/Time_Series_Analysis/timeseries_Figure_1.png" width=600>
</p>
<p align="center">
	<img src="matlab/Time_Series_Analysis/timeseries_Figure_2.png" width=600>
</p>
<p align="center">
	<img src="matlab/Time_Series_Analysis/timeseries_Figure_3.png" width=600>
</p>
<p align="center">
	<img src="matlab/Time_Series_Analysis/timeseries_Figure_4.png" width=600>
</p>
<p align="center">
	<img src="matlab/Time_Series_Analysis/timeseries_Figure_5.png" width=600>
</p>
<p align="center">
	<img src="matlab/Time_Series_Analysis/timeseries_Figure_6.png" width=600>
</p>

## 11.3 Risk Assessment
**You are the Data Scientist, consider the data and make your own decision.**  Which has higher risk, quarantine or "open for business"?  Our job as data scientists is to look at data, use statistics ([P-value](#P-value), [Bayes Theory](#Bayes_Theorem_and_Coronavirus), etc.) and evaluate [significance levels](#P-value) and [models](#SIR_Model) so that we can inform others to make data-driven decisions.

Some questions to consider:
 - Will COVID-19 deaths continue to increase?  At what rate?
 - Will car fatalities continue to increase?  At what rate?
 - Will suicides continue to increase?  At what rate?
 - **If the lockdown is effective, what is the impact to seasonal things like the seasonal flu?** Hint, this was the [worst flu season in recent history](https://www.cdc.gov/flu/about/burden/preliminary-in-season-estimates.htm) even though the USA was in lock-down for part of the "flu season" ([October-May](https://www.cdc.gov/flu/about/season/flu-season.htm)).
 - Will people continue to die of other issues (cancer, flu, heart attack, etc.)?  At what rate?
 - What are the inherent risks of leaving your home each day prior to COVID-19?  Do those still exist? (e.g. car fatality, heart attack, etc.)
 - Could the lock-down have been more effective if everything was closed, e.g. grocery stores, mail/UPS service, etc?
 - How do you evaluate these both together and individually, and what are the risks?



# 12. Great Videos to Watch <a name="Great_videos"/>
 - ["Exponential growth and epidemics"](https://youtu.be/Kas0tIxDvrg)
 - ["Understanding R nought | Khan Academy"](https://youtu.be/jKUGZvW99os)
 - ["Estimating actual COVID 19 cases (novel corona virus infections) in an area based on deaths"](https://youtu.be/mCa0JXEwDEk)
 - ["How To Tell If We're Beating COVID-19"](https://youtu.be/54XLXg4fYsc)
 - ["How To See Germs Spread - Coronavirus"](https://youtu.be/I5-dI74zxPg)
 - ["We heard the bells: The influenza of 1918"](https://youtu.be/XkGi9FKZzDI)
 - ["1918 Spanish Flu historical documentary | Swine Flu Pandemic | Deadly plague of 1918"](https://youtu.be/UDY5COg2P2c)
 
 
 


# 13. Conclusion <a name="Conclusion"/>
So why did we go through all of this trouble, and where are we on the Sigmoid curve?  Well, like any problem, we like to have as much data as possible to make good scientific decisions, and compare results where possible.  In this case, it is nice to compare COVID-19 to the common flu, SARS, MERS, etc.  As you will likely find, as we did, if you are younger than 60 [[44](https://www.cdc.gov/coronavirus/2019-ncov/specific-groups/high-risk-complications.html)], you may contract COVID-19 but are less likely to die of COVID-19.  However, it is advisable to closely follow the CDC guidelines [[45](https://www.cdc.gov/coronavirus/2019-ncov/prepare/prevention.html)] of social distancing and personal health precautions.  

The IHME COVID-19 SIR models can be found at [[48](http://www.healthdata.org/covid)], and world population data [[49](https://www.populationpyramid.net/)].

[This Jupyter notebook](https://github.com/dsbc2020/ml_training/blob/master/notebooks/Examples/coronavirus/coronavirus-fact-or-hype.ipynb) imports the CDC and WHO raw data (linked above), and provides several plots with some initial analysis.  Use your judgement and make your own decision.

We will continue to update this notebook over the next several weeks, so stay tuned!





# References <a name="References"/>
1. https://www.cdc.gov/coronavirus/2019-ncov/index.html
2. https://www.who.int/csr/don/12-january-2020-novel-coronavirus-china/en/
3. https://www.nejm.org/doi/full/10.1056/NEJMe2002387
4. https://covidtracking.com/
5. https://www.washington.edu/news/2020/02/07/interactive-map-shows-worldwide-spread-of-coronavirus/
6. https://github.com/CSSEGISandData/COVID-19
7. https://github.com/imdevskp/covid_19_jhu_data_web_scrap_and_cleaning
8. https://academic.oup.com/cid/article/52/suppl_1/S75/499147#97947460
9. https://www.cdc.gov/flu/spotlights/pandemic-global-estimates.htm
10. http://www.cidrap.umn.edu/news-perspective/2011/08/study-puts-global-2009-h1n1-infection-rate-11-21)
11. https://www.cdc.gov/flu/pandemic-resources/2009-pandemic-timeline.html
12. https://en.wikipedia.org/wiki/2009_flu_pandemic_timeline#March_2009
13. https://www.cdc.gov/vhf/ebola/history/2014-2016-outbreak/case-counts.html
14. https://www.who.int/csr/sars/country/en/
15. https://hazards.colorado.edu/quick-response-report/dynamics-of-interorganizational-risk-management-networks-during-the-2015-mers-response-in-south-korea
16. https://www.cdc.gov/flu/pandemic-resources/1918-commemoration/pandemic-timeline-1918.htm
17. https://wwwnc.cdc.gov/eid/article/12/1/05-0979_article
18. https://www.wsj.com/market-data/quotes/index/DJIA/historical-prices
19. https://www.wsj.com/market-data/quotes/index/COMP/historical-prices
20. https://www.wsj.com/market-data/quotes/index/SPX/historical-prices
21. https://www.asirt.org/safe-travel/road-safety-facts/
22. https://www.who.int/mental_health/prevention/suicide/suicideprevent/en/
23. https://www.who.int/news-room/fact-sheets/detail/cancer
24. https://www.ahajournals.org/doi/10.1161/CIRCOUTCOMES.118.005375
25. https://www.cdc.gov/flu/about/burden/preliminary-in-season-estimates.htm
26. http://www.strokecenter.org/patients/about-stroke/stroke-statistics/
27. https://www.who.int/news-room/fact-sheets/detail/drowning
28. https://www.businessinsider.com/weird-causes-of-death-2016-7#w75-accidental-suffocation-and-strangulation-in-bed--10206-deaths-7
29. https://wonder.cdc.gov/controller/datarequest/D76
30. https://pediatrics.aappublications.org/content/pediatrics/122/3/660.full.pdf?download=true
31. https://www.npr.org/sections/goatsandsoda/2018/11/30/671872574/u-n-report-50-000-women-a-year-are-killed-by-intimate-partners-family-members
32. https://www.businessinsider.com/worlds-deadliest-animals-2016-9/
33. https://braintest.com/alzheimers-statistics-throughout-the-united-states-and-worldwide/
34. https://www.childfund.org/infographic/malaria/
35. https://ourworldindata.org/homicides
36. https://www.cdc.gov/coronavirus/2019-ncov/index.html
37. https://www.census.gov
38. McCluskey, C. Connell. "Complete global stability for an SIR epidemic model with delay—distributed or discrete." Nonlinear Analysis: Real World Applications 11.1 (2010): 55-59
39. Takeuchi, Yasuhiro, Wanbiao Ma, and Edoardo Beretta. "Global asymptotic properties of a delay SIR epidemic model with finite incubation times." Nonlinear Analysis: Theory, Methods & Applications 42.6 (2000): 931-947.
40. Beretta, Edoardo, and Yasuhiro Takeuchi. "Global stability of an SIR epidemic model with time delays." Journal of mathematical biology 33.3 (1995): 250-260.
41. https://www.macrotrends.net/1319/dow-jones-100-year-historical-chart
42. https://www.macrotrends.net/1320/nasdaq-historical-chart
43. https://www.macrotrends.net/2324/sp-500-historical-chart-data
44. https://www.cdc.gov/coronavirus/2019-ncov/specific-groups/high-risk-complications.html
45. https://www.cdc.gov/coronavirus/2019-ncov/prepare/prevention.html
46. https://www.apple.com/covid19
47. https://www.coronavirus.gov/
48. http://www.healthdata.org/covid
49. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3121570/
50. https://www.fda.gov/media/134920/download
51. Yang, et.al. "Evaluating the accuracy of different respiratory specimens in the laboratory diagnosis and monitoring the viral shedding of 2019-nCoV infections", Cold Spring Harbor Laboratory Press, 10.1101/2020.02.11.20021493 (2020).
52. https://www.cdc.gov/coronavirus/2019-ncov/cases-updates/summary.html#anchor_1582494216224

