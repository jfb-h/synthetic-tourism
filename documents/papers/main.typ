#import "template.typ": template
#import "tables.typ": *

#show: template.with(
  title: [
    // Tourism magnet or money sink? Measuring the impact of the \ Elbphilharmonie in Hamburg

    The regional impact of exceptional architecture on tourism: \ A synthetic control study of the Elbphilharmonie in Hamburg
    
    // Hitting All the Right Notes? The Regional Impact of the Elbphilharmonie’s Exceptional Architecture on Tourism in Hamburg
    
    // A Symphony for Tourism? The Regional Tourist Impact of Exceptional Architecture: A Synthetic Control Analysis of Hamburg’s Elbphilharmonie

    // A Symphony for Tourism? The Elbphilharmonie’s Architectural Impact on Hamburg‘s Visitor Economy

    // Tourism in Harmony: The Elbphilharmonie’s Role in Shaping Hamburg’s Visitor Economy 

    // Building Tourism: Regional Effects of the Elbphilharmonie’s Exceptional Architecture in Hamburg 

    // Tourism, exceptional architecture, and the COVID-19 aftermath: A synthetic control analysis of the Elbphilharmonie’s impact in Hamburg

    // Iconic Architecture and Regional Tourism: Assessing the Elbphilharmonie’s Influence with Synthetic Control Methods

  ],
  
  authors: (
    (
      name: "Author 1",
      orcid: "",
      email: "author1@lmu.de",
      affiliation: [Economic Geography Group \ Department of Geography \ LMU Munich]
    ),
    (
      name: "Author 2",
      orcid: "",
      email: "author2@lmu.de",
      affiliation: [Economic Geography Group \ Department of Geography \ LMU Munich]
    ),
    (
      name: "Author 3",
      orcid: "",
      email: "author3@lmu.de",
      affiliation: [Economic Geography Group \ Department of Geography \ LMU Munich]
    ),
  ),
  
  keywords: ("exceptional architecture", "tourism", "synthetic control", "elbphilharmonie"),

  references: "references.bib",

  abstract: [
    While exceptional architecture, renowned for its transformative influence on the economic and cultural dynamics of cities, has attracted considerable scholarly attention, pinpointing its specific impacts on tourist attraction has proven to be a challenging task with ambiguous scientific findings.
    To address the existing knowledge gaps, our research examines the influence of exceptional architecture on regional tourism, focusing on the emblematic case of the ‘Elbphilharmonie’ concert hall in Hamburg.
    Methodologically, we employ a synthetic control method to quantify causal effects related to its inauguration.
    The outcomes of this analysis estimates a surplus of 13 million overnight stays between the opening of the Elbhilharmonie in January 2017 and the end of the observation period in Q2 2024. 
 
    Consequently, this study contributes to a nuanced comprehension of the effects of exceptional architecture on attracting tourism and sheds light on its impact in the (post)-pandemic period.
  ],
  
)

#let todo(s) = text(red, weight: "bold")[TODO: #s]

= Introduction <introduction>

// The COVID-19 pandemic triggered an unprecedented crisis in global tourism from 2020 to 2022, leading to a loss of USD 2.5 trillion in export revenues - nearly 1.5 times the earnings of 2019.
// As a result, tourism’s economic impact, reflected in the tourism direct gross domestic product, was halved, followed by strong rebounds backed by easing of restrictions @worldtourismorganization2021.
// It is this context in which we examine the impact of exceptional architecture on the recovery of tourism activities in the post-pandemic period.

Exceptional architecture is known for its transformative power to shape the economic and cultural landscape of their host cities @alaily-mattar2022a @alaily-mattar2018b @dreher2023 @heidenreich2015.
Due to heightened urban competition @hausler2024 @sklair2017 @zenker2013, this specific type of architecture can unleash attractive forces, has the potential to “act as a synecdoche for a city or region” @alaily-mattar2022a[p. 1], and allure tourists and inward investment @balke2018 @scerri2019.
Particularly the opening of the Guggenheim Museum in Bilbao in 1997 has brought the topic into the spotlight of scholarly attention.
Its inauguration has been linked to amplified tourism, a revitalized local economy, and an elevated cultural reputation @alaily-mattar2018b @plaza2006 @plaza2009. However, the effectiveness of exceptional architecture in attracting tourists remains a subject of disagreement. While some scholars highlight the positive and lasting economic and tourism impacts, others argue that these effects are merely short-lived, failing to achieve the anticipated outcomes @dreher2020[p. 442]. Our study sheds light on this topic by providing empirical evidence on the influence of exceptional architecture on tourism, focusing on the case of the 'Elbphilharmonie' in Hamburg. The Elbphilharmonie (Elbe Philharmonic Hall), inaugurated in January 2017, is a multifunctional building in Hamburg that includes concert halls, a hotel, apartments, and a publicly accessible plaza. Designed by the renowned architects Herzog & de Meuron, the building stands out by its striking wave-shaped glass façade atop a historic warehouse at Hamburg’s harbor @dreher2020 @hofmeister2021. It is recognized as one of Germany’s most notable recent architectural achievements @dreher2022[p. 108]. Described as a “signature building in a key location” @heuer2022[p. 90], and “tourist lighthouse” @just2022[p. 55]  that was “build to compete with New York, London or Sydney” @zenker2013[p. 647], it ranks as one of the costliest concert halls ever constructed worldwide @heuer2022. 
To assess the causal effect of the Elbphilharmonie’s inauguration on tourism overnight stays in the city of Hamburg, we employ the synthetic control method @abadie2021 @abadie2003, a robust statistical approach that enables to estimate the counterfactual scenario of Hamburg’s tourism in the absence of the Elbphilharmonie. Our analysis contributes to the empirical literature on the impact of exceptional architecture on tourism, addressing previous studies that reported “rather sobering findings” @dreher2020[p. 449]. 
In doing so, our procedure also confronts methodological challenges in understanding the genuine impact of architecture projects on additional tourism. Traditional approaches like input-output methods or correlation analysis, as exemplified in the analysis of the economic and tourist impact of the Guggenheim Museum in Bilbao @plaza2000 @plaza2006, are recognized as valuable for evaluating infrastructure benefits @scerri2019.
However, these methods have limitations in causally linking them back to specific events @doerr2020 @tkalec2017, also when it comes to making statements about temporal effects @dreher2020. In this context, the synthetic control method serves as an innovative tool in economic geography and tourism research, providing more accurate and detailed insights. Prior studies have successfully applied this method to evaluate the impact of European Union cohesion policies on tourism and culture @brandano2023, the influence of popular television series on tourist arrivals @tkalec2017, the effects of transport infrastructure on regional tourism @albalate2023 @doerr2020, or the consequences of natural disasters on tourism and migration @antonaglia2024 @kim2023.

Our empirical findings suggest that, ….
In the following sections, we first outline the impact of exceptional architecture on tourist attractiveness and highlight the challenges of measuring the resulting causal effects. In Section 3, we then present the case of the Elbphilharmonie in detail, followed by an overview of the data and methods in Section 4. We then present and discuss the results of applying the synthetic control method to the Elbphilharmonie case, focusing on its regional impact on tourism, before concluding with final remarks.

= Tourism and architecture

Over the past decades, tourism has evolved into one of the largest and fastest-growing industries globally, contributing significantly to the gross domestic product of many regions.
For example, in 2019, tourism revenues in Europe amounted to a substantial 514.9 billion euros @worldtourismorganization2021.
However, the pandemic triggered a sharp decline @plzakova2022 @worldtourismorganization2023, as travel restrictions, testing requirements, and quarantines created lasting travel hesitancy among some individuals @gossling2022 @mckercher2024.
Nevertheless, and despite initial pessimistic forecasts, the tourism industry is undergoing a robust recovery in most places, a phenomenon powered by and often referred to as “revenge tourism” @meenakshi2024 @vogler2022.
Motivated by a strong urge to travel once borders reopened, some travelers created ‘bucket lists’ to satisfy their craving for heightened excitement @meenakshi2024 making destinations renowned for their exceptional architecture an appealing choice.
In response to the economic relevance to attract tourists and the increasing competition among urban centers for economic development @hausler2024 @sklair2017 @zenker2013, many European cities have invested in prestigious architectural projects @andersson2014 @ponzini2020.
The underlying idea is that exceptional architecture can stimulate new tourism, employment opportunities, and additional tax revenues, which can be economically beneficial for urban growth @alaily-mattar2018a @plaza2006.
This phenomenon occurs because exceptional architecture may act as a unique selling point that contributes to the attractive image of a city and adds a layer of urban prestige @andersson2014 .
As a result, these buildings often become representative symbols of urban progress, motivating tourists to choose their host cities as destinations @balke2018 @boniface2021 @scerri2019 @specht2014.
This aligns with the findings from @plaza2024, who link the effects of exceptional architecture with findings from cognitive psychology and social cognition @dimaggio1997.
They emphasize that such architecture holds major cultural and symbolic meanings, as they can create strong symbolic associations and are easily remembered due to their distinctiveness, elevating the global visibility of their locations and making them memorable to potential visitors and media consumers.
These architectural icons, therefore, can serve as crucial connectors in the global media landscape, reinforcing the prominence and boosting the attractiveness (for visitors) of their host locations.
Taking a leading role and gaining visibility is especially important in the context of post-pandemic tourism, as the recovery intensifies competition among tourism-dependent economies to attract visitors @abbas2024.
However, measuring the precise effects of exceptional architecture on tourism remains challenging.
For example, studies of the ‘Guggenheim Effect’ show that museum visitors played a major role in the growth of tourism in the Basque Country after the opening @plaza2000.
However, there are methodological hurdles in determining the actual effects.
In the specific case of the Guggenheim Museum, idiosyncratic factors such as the dissolution of the terrorist organization ETA, general tourism developments, economic cycles, the increasing attractiveness of neighboring regions, and comprehensive urban developments must be taken into account, making it challenging to isolate the phenomenon @plaza2000 @voltes-dorta2016.
Another illustration underscores the difficulty of capturing the causal effects of exceptional architecture on tourism.
The study by Dreher et al. @dreher2020 examines the tourist effect of the Kunsthaus Graz, Austria (an architecturally exceptional art exhibition center inaugurated in 2003) based on the number of museum visitors on the number of overnight stays in the city.
The results show that, despite a decline in visitor numbers to the museum, overnight stays in the city increased.
The authors characterize the study’s outcome as a “rather sobering finding” (p. 449), since they discovered no statistical proof indicating that Kunsthaus Graz played a direct role in the upswing of overnight tourism.
However, they posit that the impact on tourism is more attributed to the architecture itself rather than the exhibitions because the museum operates as an icon representing the city, drawing in tourists without necessarily motivating them to explore the art exhibitions.
Our study builds on this assumption by using the Elbphilharmonie in Hamburg as a case study to explore the forward linkage effects @gelman2013a @hiller1998 of its inauguration to explore how exceptional architecture can influence overnight stays in the regional tourism sector.


= The Elbphilharmonie 

Germany, a major player in the global tourism export market @gossling2022, has faced severe impacts from the COVID-19 pandemic, particularly in its hospitality sector. In this context the case of Hamburg becomes particularly interesting as it features the architectural masterpiece, the Elbphilharmonie. As a relatively recent addition to the city’s skyline, it may have emerged as a popular destination for travelers seeking unique experiences, especially following the easing of pandemic restrictions.
From the outset, the Elbphilharmonie was ascribed identity-forming characteristics and recognized for its potential socio-economic influence due to its location, as well as the exceptional visual and emotional appeal @alaily-mattar2021a.
Architecturally integrated in/on the brick corpus of a former cocoa warehouse in Hamburg’s harbor area, it is adjacent to the historic warehouse complex and UNESCO World Heritage Site ‘Speicherstadt’ @heuer2022 (see Figure 1).
The constructions were completed in November 2016 and officially opened in early January 2017. The striking design features a conspicuous iceberg/wave structure made of glass that stands 110 meters tall.
Designed by internationally renowned architects Herzog & de Meuron, who also created the Tate Modern in London and the 'Bird's Nest' Olympic Stadium in Beijing, the building is situated in a prominent location @alaily-mattar2018, and - on par with comparable iconic architectural landmarks @ghalejough2024 - has sparked extensive media coverage.
These factors qualify it as a distinct type of exceptional architecture known as ‘star architecture’ @dreher2022.
But the Elbphilharmonie also shares another attribute often associated with star architecture – it is “expensive and controversial” @alaily-mattar2022a[p. 3].
Initially estimated at 187 million euros, the construction cost eventually rose to 866 million euros, making it one of the most expensive concert halls ever built @hofmeister2021.
During the selection process, there were some controversies, notably the awarding of the design contract to architects Herzog & de Meuron without an open bidding process or architectural competition @alaily-mattar2021a[p. 101].
From a functional perspective, the structure serves as a concert hall, which also includes a hotel and private residences.
Moreover, situated at a height of 37 meters on top of the brick corpus, it encompasses an open plaza accessible to the public, offering residents and visitors an expansive view of the city @holz2023.
By early 2024, this plaza has been experienced by over 20 million visitors @dpa2024, while within a single year until mid-2024, 852,000 tickets were sold for the concert hall @holz2024.
Nevertheless, the Elbphilharmonie project is linked to a ‘Hamburg Effect’ instead of a ‘Guggenheim Effect’ @heuer2022.
Unlike the Guggenheim Museum in Bilbao, which was constructed as a catalyst for the regeneration of a “rundown” @heidenreich2015[p. 1441] industrial city and subsequently evolved into a major tourist attraction with tangible economic benefits and a thriving art and creative scene @plaza2009, the Elbphilharmonie was designed with the primary goal of reinforcing Hamburg’s identity as a cultural and musical hub @heuer2022.
The focus to serve the local and national population gets evident in the origin of the audience attending performances in the concert hall, where the proportion of foreign attendees has not surpassed 6%.
In contrast, approximately 60 to 70% of visitors to the Guggenheim Museum in Bilbao come from foreign countries @heuer2022[p. 97].
To study of the impact of exceptional architecture on regional tourism, using the Elbphilharmonie in Hamburg as an example, is beneficial in two ways.
Firstly, the relatively low number of foreign concert attendees suggests that, if there was a positive effect, it is the architectural attraction itself rather than the concerts that attracts tourists, providing empirical support for the assumptions of @dreher2020.
Secondly, when measuring the touristic development in Bilbao in the 1990s, multiple factors beyond the opening of the Guggenheim Museum contributed to the city's attractive for tourists, including extensive urban redevelopment of former industrial areas, economic diversification, and a decline in ETA-related violence @keating2003@gomez2001. Or, as @hassink2025a[p. 3] frame it, "the megaproject of the museum and its surrounding area [...] became the symbol of urban change but, arguably, it was not its cause". In contrast, during the opening of the Elbphilharmonie, Hamburg did not experience similar idiosyncratic contextual factors, making it more feasible to accurately estimate the isolated causal effects of exceptional architecture on tourism.



// TODO: Describe data

#figure(
  image("figures/images.png"),
  scope: "parent",
  placement: top,
  caption: [(a) Elbphilharmonie Hamburg with its wave-shaped glass façade ©T.Rätzke (b) View over the Speicherstadt ©T.Rätzke (c) Architecture and construction details ©Herzog&de Meuron (d) Brick corpus of the cocoa warehouse in 1967 ©Zoch. Source: @elbphilharmonie2024.]
)

= Data and Method

== The synthetic control method

In this paper, we use the synthetic control method @abadie2021 to assess the touristic impact of the Elbphilharmonie. 
The synthetic control method aims to answer the question of whether a discrete intervention (here, the building of the Elbphilharmonie) had a causal effect on some quantity of interest (here, overnight stays), i.e., whether there was an increase (or decrease) in the quantity of interest which would not have occurred without the intervention.
In pursuit of this goal, the method follows a comparative case study design which contrasts the unit for which the intervention occurred (Hamburg) with a set of comparable units where the intervention didn't occur (other cities).
More specifically, the synthetic control method proceeds by constructing a weighted average of contrast cases representing a 'synthetic' version of the intervention unit, which can be used to assess counterfactual scenarios.
Weights are determined in a way as to maximize the pre-intervention similarity of the synthetic and the real unit in terms of the quantity of interest. Similarity is determined based on a set of predictors, which themselves have associated importance weights also subject to optimization.
Given sufficient pre-intervention similarity (taken to indicate that the behaviour of the quantity of interest is well-approximated by the weighted average of the control units), post-intervention deviations between the synthetic and the real case are then interpreted as a consequence of the intervention.

An important assumption is the absence of other idiosyncratic shocks that could lead to a deviation of the treated unit in terms of the outcome of interest. While there was a considerable shock to tourism throughout the observation period in the form of the COVID-19 pandemic, this was not idiosyncratic: The pandemic lead to almost universal travel restrictions which in turn led to an almost universal and dramatic decline in visitor numbers (as can be seen in @figure-descriptive). Nevertheless, the pandemic led to considerable variability, which can make the identification of a clear signal more difficult. Accordingly, it is important to check the robustness of the causal interpretation of a treated-control divergence, which can be achieved thorugh two different kinds of placebo tests:
First, the analysis can be rerun with intervention shifted to different points in time. If these analyses yield similarly large post-intervention differences, results are likely to represent noise and should be interpreted with care.
Second, instead of shifting the timepoint of the intervention, placebos can be constructed by assigning the intervention to other units than the one for which it occurred.
If these simulations yield similarly large effects as the actually treated unit, results are again deemed not robust. All analyses were conducted with the `tidysynth` package for the `R` programming language @dunford2025.


== Predictors and control cases

Our primary variable of interest is the number of overnight stays, observed at quarterly level from 1998 to Q2 2024. Compared to other measures of touristic activity, such as arrivals, the number of overnight stays was the most complete series, and preliminary tests indicated that arrivals did not yield substantively different findings.
As primary predictors for the identification of weights that minimize pre-intervention differences between the observed series of overnight stays and the weighted average of the control units constituting the synthetic series, we then use averages for all 5-year pre-intervention periods, separated by quarter (i.e., different averages for each quarter for each period). This specification allows for different periodicity patterns (e.g., coastal vs. alpine tourism) to influence the selection of optimal weights.
In addition, we also use 5-year periodic averages for per capita GDP as well as population size in the three years preceeding the intervention as predictors.
For the candidate pool of control cases we selected 18 German cities, including Berlin, Munich, and Cologne as comparatively sized candidates, as well as Rotterdam, Amsterdam, Kopenhagen, and Helsinki.
The former capture national touristic trends, as well as Germany-specific policy responses to the pandemic. 
The latter were included to allow for tourism dynamics specific to the hanseatic cities of the North Sea and Baltic Sea coastal areas. 
Inclusion of further cities or removal of the included smaller German cities did not lead to significant differences in the findings, supporting the selection reported here.

== Data sources

The data for German cities were obtained from two primary sources. Initial data were drawn from the online portals of the respective federal state statistical offices, where certain information is available in digital formats. 
Because the data available from the public interfaces were incomplete, we supplemented this initial effort with archival data obtained through a cross-regional request to the federal statistical offices. This request was managed by the Bavarian State Office for Statistics, which coordinated with the other statistics offices to consolidate a comprehensive dataset. For Munich and Nuremberg, pre 2005 data was only available on a yearly basis. 
For these cases, we interpolated quarterly data by using the post 2005 share for each quarter (which was checked to be sufficiently stable over time) and then distributing the available yearly data accordingly. 
Data for cities outside Germany were collected directly from the online platforms of the respective national statistical offices (Statistics Netherlands, Statistics Denmark, and Statistics Finland).
Data on GDP and population were obtained from Eurostat for the corresponding NUTS3 region. 



// Data sources: 
// Hamburg & Berlin, 1998-2024: Ankünfte, Übernachtungen in Beherbergungsbetrieben: Bundesländer, Monate. Code: 45412-0025. Statistisches Bundesamt (Destatis), online.

// North Rhine-Westphalia, 2005-2024 (Düsseldorf, Duisburg, Essen, Wuppertal, Bonn, Köln, Münster, Bielefeld, Bochum, Dortmund): Betriebe, geöffnete Beherbergungsbetriebe, Betten, angebotene Betten, Ankünfte und Übernachtungen- Gemeinden – Monat. Code: 45412-11i. Statistisches Landesamt NRW, online.
// North Rhine-Westphalia, 1998-2004 (Düsseldorf, Duisburg, Essen, Wuppertal, Bonn, Köln, Münster, Bielefeld, Bochum, Dortmund): Archival, cross-state data collection coordinated by the Bavarian State Office for Statistics.

// Bavaria, 2006-2024 (München, Nürnberg): Tourismus: Gemeinden, Betriebe, Betten, Auslastung, Übernachtungen, Ankünfte, Monat, Jahr. Code: 45511-001. Bayerisches Landesamt für Statistik, online. 
// Bavaria, 1998-2005 (München, Nürnberg): Archival, cross-state data collection coordinated by the Bavarian State Office for Statistics.

// Bremen, 1998-2024 (Bremen, Bremerhaven): Monatszahlen im Tourismus. Code: 45412-55. Statistisches Landesamt Bremen, online. 

// Hannover, 1998-2024: Archival, cross-state data collection coordinated by the Bavarian State Office for Statistics.

// Stuttgart, 2012-2024: Beherbergung im Reiseverkehr seit 2012 – monatlich. Statistisches Landesamt Baden-Württemberg, online.
// Stuttgart, 1998-2011: Archival, cross-state data collection coordinated by the Bavarian State Office for Statistics.

// Amsterdam & Rotterdam, 1998-2024: Hotels; guests, overnight stays, country of residence, region. Code: 82061. Statistics Netherlands (CBS), online. 
//Copenhagen, 1998-2024: Overnight stay by type of overnight accommodations, region, nationality of the guest and period. Code: TURIST. Statistics Denmark, online. 
// Helsinki, 1998-2024: Monthly hotel capacity and nights spent by municipality, 1995M01-2025M03. Code: 11lm. Statistics Finland, online. 

= Results and discussion

== Tourism development in Hamburg

// Increase from 4,541,687 in 1998 to 15,942,580 in 2023

#figure(
  image("figures/plot-descriptive.png"),
  scope: "parent",
  placement: top,
  caption: [Quarterly number of overnight stays for Hamburg and the 22 sampled control cases. Hamburg and selected comparable cities are highlighted. The grey shaded areas mark major pandemic-related lockdowns from March to May 2020 and from late 2020 to May 2021.]
) <figure-descriptive>

Hamburg has witnessed a steady increase in tourism over the past 30 years, similar to that of other German and Northern European cities. @figure-descriptive shows the quarterly number of overnight stays for Hamburg and the 22 sampled cities, and reveals a growth trajectory comparable to Munich or Amsterdam: Over the observation period from 1998 to 2024, overnight stays in Hamburg have more than tripled, from around 4.5 million to almost 16 million.

#todo[
- table nearest neighbor (Jakob)
- more fine-grained description, comparison (Philipp)
- divergence 1998 - 2003 (Philipp)
]

However, based on juxtaposition of trends alone, it is difficult to assess the impact of the construction of the Elbphilharmonie, which will be inspected with the synthetic control method in the next section.


== The Elbphilharmonie effect

#table1

#figure(
  image("figures/plot-difference.png"),
  scope: "parent",
  placement: top,
  caption: [Synthetic and observed series of overnight stays (a), difference between synthetic and observed series (b). Blue shaded areas highlight the post-treatment different between the synthetic and observed series. The dashed line marks the opening of the Elbphilharmonie in January 2017, the grey shaded areas mark major pandemic-related lockdowns from March to May 2020 and from late 2020 to May 2021.]
) <figure-difference>

Compared to the counterfactual Hamburg (i.e., without Elbphilharmonie), the synthetic control method estimates a surplus of 13 million overnight stays between the opening of the Elbhilharmonie in January 2017 and the end of the observation period in Q2 2024. 
@figure-difference shows the quarterly series of overnight stays for Hamburg and its 'synthetic twin' (a) and the difference between the two (b).
Despite the volatility due to the COVID-19 pandemic, there is a clearly visible divergence in the period following the intervention, with larger than expected numbers of overnight stays especially in the period after the end of the pandemic.
The difference peaks in Q2 2022, where an extra 1,039,103 overnight stays are recorded.
Vice-versa, troughs of the difference plot align with pandemic-induced lockdowns in Germany (as indicated by the shaded areas in @figure-difference) and are followed by peaks.
This might be an indication of the Elbphilharmonie -- still being relatively recent at the time of the pandemic -- contributing to Hamburg attracting 'revenge tourism', i.e., tourism driven by a disproportionate willingness to travel after the lockdown @vogler2022.
Whether recent landmarks and the visibility they create systematically interact with such rebound effects is however speculative at best and beyond the scope of this study.

#todo[
  estimate
  - seasonality of difference (Philipp?)
  - variable importance
  - monetary estimate based on per-visitor per-day spending / overnight stay cost / Durchschnittliche Vor-Ort Reiseausgaben Pro Person und Tag in HH 2023: 129 Euro (CPS GFK Destinationsmonitor HH) / (Philipp)
]

== Robustness checks via placebo trials

#todo[
  - Temporal placebo (Jakob)
  -
]

While the synthetic control research design is not amenable to classical statistical hypothesis tests, the robustness of the results can nevertheless be assessed by conducting 'placebo trials'. This is arguably especially important in a case like the one discussed here, where a global shock introduces uncertainty into the studied system. We accordingly conduct two placebo trials: First, 

#figure(
  image("figures/plot-placebos.png"),
  scope: "parent",
  placement: top,
  caption: [Difference between observed and synthetic overnight stays for Hamburg (black line) and placebo test with control units (grey lines). The dashed line marks the opening of the Elbphilharmonie.]
)


#figure(
  image("figures/plot-mspe.png"),
  caption: [Ratio of mean squared predictive error (MSPE) before and after the intervention for treated and control units.]
)


= Conclusion

This study has examined the causal effect of the inauguration of an exceptional architectural building on overnight stays in tourist accommodations.
Our contributions to the literature are threefold.
First, we expand the scientific knowledge on the effects of the (post)-pandemic period in tourism research by contextualizing the role of exceptional architecture in tourism recovery.
Our findings illustrate that exceptional architecture can act as catalysts for revitalizing urban tourism and sustaining long-term visitor engagement.
Second, by employing a synthetic control method, we introduce a robust econometric framework for evaluating large-scale interventions, addressing concerns about “poorly conceived methodologies” in tourism research @zopiatis2021, p. 279.
This methodological approach not only strengthens causal inference but also establishes a replicable model for future studies in regional tourism analysis.
Third, we contribute to the empirical literature on the impact of exceptional architecture on tourism, addressing previous studies with mixed findings or cases influenced by a synergy of multiple contextual factors affecting tourism development.
By applying this rigorous methodology, we reconstructed the counterfactual trajectory that tourism in Hamburg would have followed in the absence of the Elbphilharmonie’s construction.




We constructed a control group from XXX ….

This approach enables a more precise assessment of its true impact, providing valuable insights for urban planners, policymakers, and scholars interested in the intersection of architecture and regional economic development.

embedd our results in the wider field and recent discussion around megaprojects (@hassink2025a): "Across both industrialised and emerging economies worldwide, megaprojects have become important drivers of economic development" (p.1) | 

“despite possible increase in the inauguration year, star architecture can have quite short-lived quantitative media effects.” @alaily-mattar2020, p. 97

Our findings show a positive effect of the Elbphilharmonie on overnight stays even 8 years after its inauguration

Given that the effects of exceptional architecture extend beyond economic considerations @alaily-mattar2022a, further research could integrate our findings into discussions on its potential to reshape cultural and urban identity @heidenreich2015; @mcneill2000, act as a trigger for innovation @dreher2022, serve as a symbol of change and influence institutional work @lawrence2015, function as a focal point for negotiating norms and standards @grubbauer2022, and ultimately emerge as a ‘field-configuring place’ @capron2024.

Critique exceptional architecture?:

However, the creation of exceptional architecture is not without its critiques, as such buildings often embody and project power to maximize commercial gains for the capitalist elite @sklair2006.

These architectural works can be co-opted to publicly legitimize and politically enforce the underlying projects, making them essential components of a post-political regime characterized by neoliberal governmentality @balke2018[p. 997], reflecting a broader societal trend toward the commercialization of increasingly diverse aspects of our life @hausler2024[p. 225].
