#import "template.typ": template
#import "tables.typ": *

#show: template.with(
  title: [
    // Tourism magnet or money sink? Measuring the impact of the \ Elbphilharmonie in Hamburg

    The local impact of exceptional architecture on tourism: \ A synthetic control study of the Elbphilharmonie in Hamburg
    
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
      name: "Yannick Eckhardt",
      orcid: "https://orcid.org/0009-0001-0963-083X",
      email: "y.eckhardt@lmu.de",
      affiliation: [Economic Geography Group \ Department of Geography \ LMU Munich]
    ),
    (
      name: "Jakob Hoffmann",
      orcid: "https://orcid.org/0000-0001-5764-6281",
      email: "jakob.hoffmann@lmu.de",
      affiliation: [Economic Geography Group \ Department of Geography \ LMU Munich]
    ),
    (
      name: "Philipp Namberger",
      orcid: "https://orcid.org/0000-0001-8472-912X",
      email: "philipp.namberger@lmu.de",
      affiliation: [Economic Geography Group \ Department of Geography \ LMU Munich]
    ),
  ),
  
  keywords: ("exceptional architecture", "tourism", "synthetic control", "Elbphilharmonie"),

  references: "references.bib",

  abstract: [
    Exceptional architecture is widely recognized for its seeming impact on the cultural and economic trajectories of cities.
    However, the specific attractive potential of any given project and thus its impact on the regional economy is often contentious, and identifying measurable increases for outcomes of interest, such as visitor numbers, is empirically challenging.
    This study investigates the causal effects of the Elbphilharmonie concert hall in Hamburg on local tourism development.
    Employing the synthetic control method, we create a counterfactual scenario to estimate how Hamburg’s tourism trajectory might have unfolded without the construction of the Elbphilharmonie.
    Contrasting recent debates highlighting the often underwhelming nature of 'star architecture', our findings indicate that the concert hall has had a major effect on tourism: In the seven and a half years from its opening in January 2017 to the second quarter of 2024, the Elbphilharmonie is estimated to be responsible for 13 million additional overnight stays, despite the period covering the covid pandemic.
  ],
)

#let todo(s) = text(red, weight: "bold")[TODO: #s]

= Introduction <introduction>

// The COVID-19 pandemic triggered an unprecedented crisis in global tourism from 2020 to 2022, leading to a loss of USD 2.5 trillion in export revenues - nearly 1.5 times the earnings of 2019.
// As a result, tourism’s economic impact, reflected in the tourism direct gross domestic product, was halved, followed by strong rebounds backed by easing of restrictions @worldtourismorganization2021.
// It is this context in which we examine the impact of exceptional architecture on the recovery of tourism activities in the post-pandemic period.

Exceptional architecture is known for its transformative power in shaping the economic and cultural landscape of its host city @alaily-mattar2022a @alaily-mattar2018b @dreher2023 @heidenreich2015.
In the context of heightened urban competition @hausler2024 @sklair2017 @zenker2013, especially among urban destinations @defrantz2018, highly visible architectural projects can create recognizable regional identities and “act as a synecdoche for a city or region” @alaily-mattar2022a[p. 1], attracting tourists and inward investment in the process and thus providing a competitive edge @balke2018 @scerri2019.
Particularly the opening of the Guggenheim Museum in Bilbao in 1997 has brought the topic into the spotlight of scholarly attention:
Its inauguration has been linked to amplified tourism, a revitalized local economy, and an elevated cultural reputation @alaily-mattar2018b @plaza2006 @plaza2009. However, the effectiveness of exceptional architecture in attracting tourists remains a subject of disagreement. While some scholars highlight the positive and lasting economic and tourism impacts, others argue that these effects are merely short-lived, failing to achieve the anticipated outcomes @dreher2020[p. 442].
We contribute empirical evidence to this debate in the form of a focused case study measuring the touristic impact of the 'Elbphilharmonie' in Hamburg.
The Elbphilharmonie (Elbe Philharmonic Hall), inaugurated in January 2017, is a multifunctional building in Hamburg that includes concert halls, a hotel, apartments, and a publicly accessible plaza.
Designed by the renowned architects Herzog & de Meuron, the building stands out by its wave-shaped glass façade atop a historic warehouse at Hamburg’s harbor @dreher2020 @hofmeister2021.
It is recognized as one of Germany’s most notable recent architectural projects @dreher2022[p. 108] and is described as a “signature building” @heuer2022[p. 90] or “tourist lighthouse” @just2022[p. 55] that is “build to compete with New York, London or Sydney” @zenker2013[p. 647]. It also ranks as one of the costliest concert halls ever constructed worldwide @heuer2022. 
To assess Elbphilharmonie's causal effect on tourism in the city of Hamburg, we employ the synthetic control method @abadie2021 @abadie2003 to measure the divergence of overnight stays against a counterfactual scenario representing tourism development in the absence of the Elbphilharmonie's construction.
// Our analysis contributes to the empirical literature on the impact of exceptional architecture on tourism, addressing previous studies that reported “rather sobering findings” @dreher2020[p. 449]. 
// In doing so, our procedure also confronts methodological challenges in understanding the genuine impact of architecture projects on additional tourism.
Traditional approaches like input-output methods or correlation analysis, as exemplified in the analysis of the economic and tourist impact of the Guggenheim Museum in Bilbao @plaza2000 @plaza2006, are recognized as valuable for evaluating infrastructure benefits @scerri2019.
However, these methods have limitations in causally linking such benefits back to specific events @doerr2020 @tkalec2017, often conflating different possible explanations, and in identifying effects unfolding over time @dreher2020.
In this context, the synthetic control method serves as an suitable tool explicitly designed for measuring the impact of idiosyncratic events.
Prior studies have successfully applied the synthetic control method to evaluate, e.g., the impact of European Union cohesion policies on tourism and culture @brandano2023, the influence of popular television series on (film) tourist arrivals @tkalec2017, the effects of transport infrastructure on regional tourism @albalate2023 @doerr2020, or the consequences of natural disasters on tourism and migration @antonaglia2024 @kim2023.

Our empirical findings indicate that the Elbphilharmonie has had a sustained positive impact on tourism development in Hamburg, resulting in an additional 13 million overnight stays within seven and a half years since its opening. 
In the following sections, we will first outline the theoretical and empirical discussions regarding the influence of exceptional architecture on tourist attractiveness, while also addressing the methodological challenges associated with identifying causal effects. Section 3 presents the Elbphilharmonie as a case study, followed by a description of the data and the synthetic control method in Section 4. We then report the empirical results in Section 5, which includes the estimated 'Elbphilharmonie Effect' and its regional implications for tourism. Additionally, we will conduct robustness checks to validate our findings, concluding with a discussion of the broader implications.


= Tourism and architecture

Over the past decades, tourism has evolved into one of the largest and fastest-growing industries globally, contributing substantially to the gross domestic product of many regions.
For example, in 2019, tourism revenues in Europe amounted to a substantial 514.9 billion euros @worldtourismorganization2021.
However, the pandemic triggered a sharp decline @plzakova2022 @worldtourismorganization2023, as travel restrictions, testing requirements, and quarantines created lasting travel hesitancy among some individuals @gossling2022 @mckercher2024.
Nevertheless, and despite initial pessimistic forecasts, the tourism industry is undergoing a robust recovery in most places, a phenomenon powered by and often referred to as “revenge tourism” @meenakshi2024 @vogler2022.
Motivated by a strong urge to travel once borders reopened, some travelers created ‘bucket lists’ to satisfy their craving for heightened excitement @meenakshi2024, making destinations renowned for their exceptional architecture an appealing choice.
In response to the economic relevance to attract tourists and the increasing competition among urban centers for economic development @hausler2024 @sklair2017 @zenker2013, many European cities have invested in prestigious architectural projects @andersson2014 @ponzini2020.
The underlying idea is that exceptional architecture can stimulate new tourism, employment opportunities, and additional tax revenues, which can be economically beneficial for urban development @alaily-mattar2018a @plaza2006.
This phenomenon occurs because exceptional architecture may act as a unique selling point that contributes to the attractive image of a city and adds a layer of urban prestige @andersson2014 @romao2025.
As a result, these buildings often become representative symbols of urban progress, motivating tourists to choose their host cities as destinations @balke2018 @boniface2021 @scerri2019 @specht2014.
This aligns with the findings from #cite(<plaza2024>, form: "prose"), who link the effects of exceptional architecture with findings from cognitive psychology and social cognition @dimaggio1997.
They emphasize that such architecture holds major cultural and symbolic meanings, as they can create strong symbolic associations and are easily remembered due to their distinctiveness, elevating the global visibility of their locations and making them memorable to potential visitors and media consumers.
These architectural icons, therefore, can serve as crucial connectors in the global media landscape, reinforcing the prominence and boosting the attractiveness (for visitors) of their host locations.
Taking a leading role and gaining visibility is especially important in the context of post-pandemic tourism, as the recovery intensifies competition among tourism-dependent economies to attract visitors @abbas2024.
However, measuring the precise effects of exceptional architecture on tourism remains challenging.
For example, studies of the ‘Guggenheim Effect’ show that museum visitors played a major role in the growth of tourism in the Basque Country after the opening @plaza2000.
However, there are methodological hurdles in determining the actual effects.
In the specific case of the Guggenheim Museum, idiosyncratic factors such as the dissolution of the terrorist organization ETA, general tourism developments, economic cycles, the increasing attractiveness of neighboring regions, and comprehensive urban developments must be taken into account, making it challenging to isolate the phenomenon @plaza2000 @voltes-dorta2016.
Another example underscores the difficulty of capturing the causal effects of exceptional architecture on tourism.
The study by #cite(<dreher2020>, form: "prose") examines the tourist effect of the Kunsthaus Graz, Austria (an architecturally exceptional art exhibition center inaugurated in 2003) based on the number of museum visitors on the number of overnight stays in the city.
The results show that, despite a decline in visitor numbers to the museum, overnight stays in the city increased.
The authors characterize the study’s outcome as a “rather sobering finding” (p. 449), since they discovered no statistical proof indicating that Kunsthaus Graz played a direct role in the upswing of overnight tourism.
However, they posit that the impact on tourism is more attributed to the architecture itself rather than the exhibitions because the museum operates as an icon representing the city, drawing in tourists without necessarily motivating them to explore the art exhibitions.
Our study builds on this assumption by using the Elbphilharmonie in Hamburg as a case study to explore the forward linkage effects @gelman2013a @hiller1998 of its inauguration to explore how exceptional architecture can influence overnight stays in the local tourism sector.


= The Elbphilharmonie 

Germany, a major player in the global tourism export market @gossling2022, has faced severe impacts from the COVID-19 pandemic, particularly in its hospitality sector. In this context the case of Hamburg becomes particularly interesting as it features the architectural masterpiece, the Elbphilharmonie. As a relatively recent addition to the city’s skyline, it may have emerged as a popular destination for travelers seeking unique experiences, especially following the easing of pandemic restrictions.
From the outset, the Elbphilharmonie was ascribed identity-forming characteristics and recognized for its potential socio-economic influence due to its location, as well as the exceptional visual and emotional appeal @alaily-mattar2021a.
Architecturally integrated in/on the brick corpus of a former cocoa warehouse in Hamburg’s harbor area, it is adjacent to the historic warehouse complex and UNESCO World Heritage Site ‘Speicherstadt’ @heuer2022 (see Figure 1).
The constructions were completed in November 2016 and officially opened in early January 2017. The striking design features a conspicuous iceberg/wave structure made of glass that stands 110 meters tall.
Designed by internationally renowned architects Herzog & de Meuron, who also created the Tate Modern in London and the 'Bird's Nest' Olympic Stadium in Beijing, the building is situated in a prominent location @alaily-mattar2018, and - on par with comparable iconic architectural landmarks @ghalejough2024 - has sparked extensive media coverage.
These factors qualify it as a distinct type of exceptional architecture known as ‘star architecture’ @dreher2022.
But the Elbphilharmonie also shares another attribute often associated with star architecture: it is “expensive and controversial” @alaily-mattar2022a[p. 3].
Initially estimated at 187 million euros, the construction cost eventually rose to 866 million euros, making it one of the most expensive concert halls ever built @hofmeister2021.
During the selection process, there were some controversies, notably the awarding of the design contract to architects Herzog & de Meuron without an open bidding process or architectural competition @alaily-mattar2021a[p. 101].

From a functional perspective, the structure serves as a concert hall, which also includes a hotel and private residences.
Moreover, situated at a height of 37 meters on top of the brick corpus, it encompasses an open plaza accessible to the public, offering residents and visitors an expansive view of the city @holz2023.
By early 2024, this plaza has been experienced by over 20 million visitors @dpa2024, while within a single year until mid-2024, 852,000 tickets were sold for the concert hall @holz2024.
Nevertheless, the Elbphilharmonie project is linked to a ‘Hamburg Effect’ instead of a ‘Guggenheim Effect’ @heuer2022.
Unlike the Guggenheim Museum in Bilbao, which was constructed as a catalyst for the regeneration of a “rundown” @heidenreich2015[p. 1441] industrial city and subsequently evolved into a major tourist attraction with tangible economic benefits and a thriving art and creative scene @plaza2009, the Elbphilharmonie was designed with the primary goal of reinforcing Hamburg’s identity as a cultural and musical hub @heuer2022.
The focus to serve the local and national population gets evident in the origin of the audience attending performances in the concert hall, where the proportion of foreign attendees has not surpassed 6%.
In contrast, approximately 60 to 70% of visitors to the Guggenheim Museum in Bilbao come from foreign countries @heuer2022[p. 97].
To study the impact of exceptional architecture on local tourism, using the Elbphilharmonie in Hamburg as an example, is beneficial in two ways.
Firstly, the relatively low number of foreign concert attendees suggests that, if there was a positive effect, it is the architectural attraction itself rather than the concerts that attracts tourists, providing empirical support for the assumptions of @dreher2020.
Secondly, when measuring the touristic development in Bilbao in the 1990s, multiple factors beyond the opening of the Guggenheim Museum contributed to the city's attractive for tourists, including extensive urban redevelopment of former industrial areas, economic diversification, and a decline in ETA-related violence @keating2003@gomez2001. Or, as #cite(<hassink2025a>, form:"prose") frame it, "the megaproject of the museum and its surrounding area [...] became the symbol of urban change but, arguably, it was not its cause" (p. 257). In contrast, during the opening of the Elbphilharmonie, Hamburg did not experience similar large scale idiosyncratic contextual factors (for a discussion, see Section 5), making it more feasible to accurately estimate the isolated causal effects of exceptional architecture on tourism.



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
In pursuit of this goal, the method follows a comparative case study design which contrasts the unit for which the intervention occurred (Hamburg) with a set of comparable units where the intervention did not occur (other cities).
More specifically, the synthetic control method proceeds by constructing a weighted average of contrast cases representing a 'synthetic' version of the intervention unit, which can be used to assess counterfactual scenarios.
Weights are determined in a way as to maximize the pre-intervention similarity of the synthetic and the real unit in terms of the quantity of interest. Similarity is determined based on a set of predictors, which themselves have associated importance weights also subject to optimization.
Given sufficient pre-intervention similarity (taken to indicate that the behaviour of the quantity of interest is well-approximated by the weighted average of the control units), post-intervention deviations between the synthetic and the real case are then interpreted as a consequence of the intervention.

An important assumption is the absence of other idiosyncratic shocks that could lead to a deviation of the treated unit in terms of the outcome of interest. While there was a considerable shock to tourism throughout the observation period in the form of the COVID-19 pandemic, this was not idiosyncratic: The pandemic lead to almost universal travel restrictions which in turn led to an almost universal and dramatic decline in visitor numbers (as can be seen in @figure-descriptive). Nevertheless, the pandemic led to considerable variability, which can make the identification of a clear signal more difficult. Accordingly, it is important to check the robustness of the causal interpretation of a treated-control divergence, which can be achieved thorugh two different kinds of placebo tests:
First, placebos can be constructed by assigning the intervention to other units than the one for which it occurred.
Second, instead of switching the unit, the analysis can be rerun with intervention shifted to different points in time. If these analyses yield similarly large post-intervention differences, results are likely to represent noise and should be interpreted with care.
If these simulations yield similarly large effects as the actually treated unit, results are again deemed not robust. All analyses were conducted with the `tidysynth` package for the `R` programming language @dunford2025.


== Predictors and control cases

Our primary variable of interest is the number of overnight stays, observed at quarterly level from 1998 to Q2 2024. Compared to other measures of touristic activity, such as arrivals, the number of overnight stays was the most complete series, and preliminary tests indicated that arrivals did not yield substantively different findings. The latter is not surprising, as the average length of stay (overnight stays divided by arrivals) for city breaks has remained comparatively constant over time. 
As primary predictors for the identification of weights that minimize pre-intervention differences between the observed series of overnight stays and the weighted average of the control units constituting the synthetic series, we then use averages for all 5-year pre-intervention periods, separated by quarter (i.e., different averages for each quarter for each period). This specification allows for different periodicity patterns (e.g., coastal vs. alpine tourism) to influence the selection of optimal weights. 
In addition, we also use 5-year periodic averages for per capita GDP as well as population size in the three years preceeding the intervention as predictors. GDP per capita and population size are valuable additional predictors for constructing the synthetic Hamburg as they capture the key economic and demographic fundamentals that influence tourism demand and ensure the control units reflect similar structural conditions prior to the intervention.
For the candidate pool of control cases we selected 18 German cities, including Berlin, Munich, and Cologne as comparatively sized candidates, as well as Rotterdam, Amsterdam, Copenhagen, and Helsinki.
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

Hamburg has experienced a steady increase in tourism over the past 30 years, mirroring trends observed in other major German and Northern European cities. @figure-descriptive shows the quarterly number of overnight stays for Hamburg and the 22 other sampled cities, revealing a growth trajectory that aligns closely with cities such as Munich or Amsterdam. From 1998 to 2024, overnight stays in Hamburg more than tripled, rising from approximately 4.5 million to nearly 16 million. Among the highlighted cities, Berlin stands out with the steepest increase, particularly from the early to mid-2000s. This growth can be attributed to Berlin’s evolving role as the capital of reunified Germany, its emergence as a global cultural and political hub, and a surge in international conferences, exhibitions, and events. Munich also exhibits strong growth, supported by its prominence in the business travel sector and large-scale cultural events. Amsterdam shows consistent increases in demand, though this has been more recently tempered by regulatory constraints. The city's 'Tourism in Balance' policy, introduced in 2021, caps annual tourist hotel overnight stays at 20 million in response to concerns over overtourism and resident wellbeing @cityofamsterdam2025.
In contrast, Hamburg has traditionally lacked the same scale of recurring mega-events or administrative centrality. While it today has a strong tourism base and a vibrant cultural sector, its international profile has historically been more modest. A notable moment in the data is the dip around 2001 across several cities, particularly Berlin, Amsterdam, and Munich. This downturn likely reflects the global travel shock triggered by the 9/11 terrorist attacks, which disproportionately affected internationally exposed destinations. Hamburg, whose tourism at the time was more domestically oriented, appears less impacted by the immediate fallout. Despite Hamburg’s steady long-term growth, these descriptive trends alone are insufficient to isolate the effect of a single intervention such as the construction of the Elbphilharmonie. To more precisely evaluate its impact, we turn to the synthetic control method in the following section.


/* #todo[
- table nearest neighbor (Jakob)
- more fine-grained description, comparison (Philipp)
- divergence 1998 - 2003 (Philipp)
- we say more about other cities than Hamburg right now
- Do we really take IFA & ITB as example drivers behind Berlins trajectory?
] */

== The Elbphilharmonie effect

#table1<table-comparison>

#figure(
  image("figures/plot-difference.png"),
  scope: "parent",
  placement: top,
  caption: [(a) Synthetic and observed series of overnight stays, (b) difference between synthetic and observed series. Blue shaded areas highlight the post-treatment different between the synthetic and observed series. The grey shaded areas mark major pandemic-related lockdowns from March to May 2020 and from late 2020 to May 2021.]
) <figure-difference>

The synthetic control method estimates a surplus of 13 million overnight stays in the 7.5 years between the opening of the Elbphilharmonie in January 2017 and the end of the observation period in Q2 2024, compared to the counterfactual Hamburg without Elbphilharmonie. 
@figure-difference shows the quarterly series of overnight stays for Hamburg and its 'synthetic twin' (a) and the difference between the two (b).
Despite the volatility due to the COVID-19 pandemic, there is a clearly visible divergence in the period following the intervention, with a pronounced increase in overnight stays especially in the period after the end of the pandemic.
The difference peaks in Q2 2022, where an extra 1,039,103 overnight stays are recorded.
Vice-versa, troughs of the difference plot align with pandemic-induced lockdowns in Germany (as indicated by the shaded areas in @figure-difference) and are followed by peaks.
This might be an indication of the Elbphilharmonie -- still being relatively recent at the time of the pandemic -- contributing to Hamburg attracting 'revenge tourism', i.e., tourism driven by a disproportionate willingness to travel after the lockdown @vogler2022.
Whether recent landmarks and the visibility they create systematically interact with such rebound effects is however speculative at best and beyond the scope of this study.

The synthetic control method is only meaningful if a sufficiently good pre-intervention match between the synthetic and the observed outcome series can be achieved.
In addition to visual guidance to this effect provided in @figure-difference, @table-comparison provides numerical comparisons between the observed and synthetic units and the donor pool average for overnight stays (2007 to 2011 period), as well as GDP and population statistics.
While the donor pool average is far below Hamburg in both the outcome variable (overnight stays) as well as the additional predictors (per-capita GDP and population), the weighted average of the synthetic unit comes quite close, with an error of less than 1% for most predictors, except for overnight stays in 1998-2001 (\<5%) and population (12.8%). Regarding the composition of the estimate, the optimization procedure allocates most of the weight to five cities: Berlin (0.35), Bonn (0.35), Düsseldorf (0.22), Cologne (0.06), and Amsterdam (0.03). While the large weight for Berlin seems plausible given the surface-level similarities in size, economy, and geography, the equally large weight for Bonn is more difficult to explain.
This is a known limitation of the synthetic control method - the optimal weights are not always easily interpreted @abadie2021.
Similarly, variable importance weights are available for inspection but somewhat difficult to assess:
The most important predictor (0.20) is the number of overnight stays in Q4 over the period 2002 to 2006.
Overall, it seems that Q4 is more relevant than the other quarters for identifying a good match for Hamburg's pre-intervention tourism dynamics.
GDP and size are less important, with GDP in the 2005 to 2009 period as the highest-weight non-overnight-stays predictor in position six.
A more accessible metric is the ratio of post-intervention to pre intervention mean squared predictive error (MSPE, @figure-mspe), which indicates how much better the synthetic series matches the observed series before vs. after the intervention.
Given a significant effect of the intervention, this should be large for the treated unit but not for the control units.
This is indeed the case for Hamburg, with a post-intervention error that is more than 60 times higher than before the intervention, clearly indicating a change-point in the tourism dynamics around the opening of the Elbphilharmonie.




// #todo[
//   estimate
//   - seasonality of difference (Philipp?)
//   - variable importance
//   - monetary estimate based on per-visitor per-day spending / overnight stay cost / Durchschnittliche Vor-Ort Reiseausgaben Pro Person und Tag in HH 2023: 129 Euro (CPS GFK Destinationsmonitor HH) / (Philipp)
// ]


== Robustness checks via placebo trials

While the synthetic control research design is not amenable to classical statistical hypothesis tests, the robustness of the results can nevertheless be assessed by conducting 'placebo trials'.

#figure(
  image("figures/plot-mspe.png"),
  caption: [Ratio of mean squared predictive error (MSPE) before and after the intervention for the treated and the control units.]
)<figure-mspe>

This is arguably especially important in a case like the one discussed here, where a global shock in the form of the covid pandemic introduces uncertainty into the studied system. We accordingly conduct two kinds of placebo trials:
First, a unit-switching placebo trial which implies running the synthetic control method for units that did not receive the intervention @abadie2015.
And second, a backdating placebo trial, pretending that the intervention took place at an earlier point in time than the actual intervention @abadie2021.
If effects similar in size to the one identified by running the synthetic control method for the correct unit at the correct time can be obtained by placebo trials, the result is deemed not robust.
@figure-robustness (a) shows the results of the unit-switiching placebo trial with the analysis repeated for all control units in the donor pool.
While there is a significant amount of variation for the control unit trials, none of them match the same effect magnitude as the one identified for Hamburg.
The closest control is Rotterdam, which is the only control unit with a considerably elevated ratio of post-intervention to pre-intervention MSPE (@figure-mspe).
This can be attributed to the fact that Rotterdam underwent its own ‘intervention’ during the same period, marked by a boost of its touristic appeal through progressive architecture (e.g. the Markthal or Depot Boijmans Van Beuningen) and cultural events @nientied2021, earning it the label 'the capital of coolness' @nieuwland2021.
However, the difference series for Rotterdam shows considerable fluctuation even after the end of the covid pandemic and its characteristics should probably not be overstated.
The backdating robustness check also gives no indication that a similar effect to the one obtained for the actual intervention can be recovered from a temporal placebo.
@figure-robustness (b) shows the result of running the synthetic control procedure with the intervention advanced from 2017 to 2010: The synthetic series does not significantly diverge from the observed series between the placebo intervention and the actual intervention, but does still recover the divergence observed after the opening of the Elbphilharmonie in 2017.
Together, these results make us confident that the observed divergence is not purely a result of noise.
However, this does not mean that the result is not noisy; there is still a significant amount of variation which likely renders the estimate of the actual effect rather imprecise and accordingly care should be taken in its interpretation.



A final potential source of confounding is the designation of the _Speicherstadt_, in which Elbphilharmonie is located, as world heritage in 2015.
This carries the risk of misattribution of a potential world heritage effect on overnight stays to the Elbphilharmonie.
Since this is also an idiosyncratic shock to the treated unit and occurred at a similar time, such misattribution would not be caught by the synthetic control method.
Accordingly, we rely on Google search trend data @googletrends2025 to assess the degree to which world heritage might have had an impact on tourism similar to the one of the Elbphilharmonie. @figure-google shows the search index for the two terms 'Elbphilharmonie' and 'Speicherstadt' and shows a clear difference in visibility:
While there is a notable spike around the opening of the Elbphilharmonie, there is only a miniscule reaction in search behaviour around the time of the world heritage nomination.
Because Google Trends has been shown to be a reasonable tool to approximate destination interest or to forecast tourism demand and evaluate the impact of major events @dinis2019 @onder2017 @botha2024, we are quite confident that the possibility of misattribution error does not dominate our findings.


#figure(
  image("figures/plot-placebos-both.png"),
  scope: "parent",
  placement: top,
  caption: [(a) Difference between observed and synthetic overnight stays for Hamburg (black line) and placebo test with control units (grey lines). (b) Synthetic and observed series with the intervention predated to 2010.]
)<figure-robustness>


= Conclusion
This study examines the local impact of exceptional architecture on tourism by analyzing the inauguration of the Elbphilharmonie in Hamburg. Using the synthetic control method, we construct a data-driven counterfactual to assess whether the building’s opening had a causal effect on overnight stays that would not have occurred otherwise. The findings provide robust evidence that the Elbphilharmonie generated an estimated 13 million additional overnight stays in the seven and a half years following its opening in 2017. To contextualize these findings, a rough projection based on the average on-site travel expenses of €129 per person per day in 2023 @hamburgtourismus2024 suggests that this translates into approximately €1.7 billion in additional touristic spending by overnight visitors.

Our study contributes to the growing literature on urban megaprojects and tourism development in several ways. First, by applying the synthetic control method to the case of the Elbphilharmonie, a recent and high-profile example of exceptional architecture, we offer robust empirical evidence of its tourism effects. Second, we provide a transparent and replicable methodological framework for assessing the causal impacts of place-based interventions on tourism, responding to ongoing calls for greater rigor in tourism research @zopiatis2021. Third, we advance the conceptual understanding of how exceptional architecture can function not merely as an aesthetic spectacle but as a sustained driver of tourism flows, with effects that persist amid external shocks such as the COVID-19 pandemic and potentially contribute to the dynamics of post-pandemic “revenge tourism". 
Our findings demonstrate that a single, exceptional architectural intervention can exert measurable and lasting effects on local tourism flows. More broadly, they offer empirical clarity to a field often marked by mixed results and context-specific contingencies, and contribute to debates on the role of urban megaprojects as an instrument of economic development in both industrialized and emerging economies @hassink2025a[p. 255]. While some scholars caution that the tourism effects of exceptional architecture may be short-lived, the Elbphilharmonie appears to defy this pattern, showing persistent impact nearly eight years after its opening.

However, there are also critical voices, as such projects can reflect and reinforce power structures, serving the symbolic and material interests of dominant actors. They may be used to legitimize neoliberal agendas and promote 'post-political' forms of urban governance, where the spectacle of innovation conceals the exclusionary and commercial logics underlying development @sklair2006 @balke2018 @hausler2024.
Future research can incorporate our findings and extend them beyond economic metrics and explore the broader cultural and institutional implications of exceptional architecture. Recent work suggests that such buildings may serve as ‘field-configuring places’ @capron2024, or function as sites of innovation and institutional change @dreher2022 @lawrence2015. 

#figure(
  image("figures/google-trends.png"),
  scope: "parent",
  placement: top,
  caption: [
    Google trends for search terms 'Elbphilharmonie' and 'Speicherstadt'. 
    Data retrieved from #cite(<googletrends2025>, form: "prose").
  ]
)<figure-google>



