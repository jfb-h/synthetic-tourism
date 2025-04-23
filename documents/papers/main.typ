#import "template.typ": template
#show: template.with(
  title: [
    Tourism magnet or money sink? Measuring the regional impact of the Elbphilharmonie
    
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
    While exceptional architecture, renowned for its transformative influence on the economic and cultural dynamics of cities, has attracted considerable scholarly attention, pinpointing its specific impacts on tourist attraction has proven to be a challenging task – especially in the post-pandemic times.
    To address these existing knowledge gaps, our research examines the influence of exceptional architecture on tourism, focusing on the emblematic case of the ‘Elbphilharmonie’ concert hall in Hamburg.
    Methodologically, we employ a synthetic control method to quantify causal effects related to its inauguration.
    The outcomes of this analysis suggest that... 
    Consequently, this study contributes to a nuanced comprehension of the effects of exceptional architecture on attracting tourism and sheds light on its impact in the (post)-pandemic period. 

  ],
  
)

= Introduction <introduction>

The COVID-19 pandemic triggered an unprecedented crisis in global tourism from 2020 to 2022, leading to a loss of USD 2.5 trillion in export revenues - nearly 1.5 times the earnings of 2019.
As a result, tourism’s economic impact, reflected in the tourism direct gross domestic product, was halved, followed by strong rebounds backed by easing of restrictions @worldtourismorganization2021.
It is this context in which we examine the impact of exceptional architecture on the recovery of tourism activities in the post-pandemic period.
Exceptional architecture is known for its transformative power to shape the economic and cultural landscape of their host cities @alaily-mattar2022a @alaily-mattar2018b @dreher2023 @heidenreich2015.
Due to heightened urban competition @hausler2024 @sklair2017 @zenker2013, this specific type of architecture can unleash attractive forces, has the potential to “act as a synecdoche for a city or region” @alaily-mattar2022a, p. 1 and allure tourists and inward investment @balke2018 @scerri2019.
Particularly the opening of the Guggenheim Museum in Bilbao in 1997 has brought the topic into the spotlight of scholarly attention.
Its inauguration has been linked to amplified tourism, a revitalized local economy, and an elevated cultural reputation @alaily-mattar2018b @plaza2006 @plaza2009.
But, nevertheless, the evidence on the effectiveness of exceptional architecture in attracting tourists has been subject to divergent perspectives.
Some authors emphasize the positive and enduring economic and tourist effects, others contend that these consequences are merely short-term and fail to yield the desired impact @dreher2020, p. 442.
Moreover, methodologically, understanding the genuine impact of architecture projects on additional tourism poses challenges.
Traditional approaches like input-output methods or correlation analysis, as exemplified in the analysis of the economic and tourist impact of the Guggenheim Museum in Bilbao @plaza2000 @plaza2006, are recognized as valuable for evaluating infrastructure benefits @scerri2019.
However, these methods have limitations in causally linking them back to specific events @doerr2020 @tkalec2017, also when it comes to making statements about temporal effects @dreher2020.
To address these shortcomings, we employ a synthetic control approach @abadie2021 @abadie2003 to estimate the causal effect of the inauguration of an exceptional architecture building on overnight stays in tourist accommodations and highlight the effects in the aftermath of the COVID-19 pandemic.
Relatively new to geography and regional tourism research, this innovative method has proven to be insightful.
For example, researchers have assessed the impact of the European Union’s cohesion policy on tourism and culture @brandano2023, examined the causal effects of a popular television series on tourist arrivals @tkalec2017, investigated how transport infrastructure influences regional tourism @albalate2023 @doerr2020, and analyzed the effects of natural disasters on tourism and migration @antonaglia2024 @kim2023.
To answer our research question of how exceptional architecture influences tourism and what the effects in the post-pandemic period are, we examine the case of the Elbphilharmonie in Hamburg and compare overnight stays and their synthetic counterparts, beginning from the date when the building was open to the public.
Inaugurated in January 2017, the ‘Elbphilharmonie’ (Elbe Philharmonic Hall) in Hamburg encompasses concert halls, a hotel, apartments, and a publicly accessible plaza.
It was designed by renowned architects Herzog & de Meuron, and integrates a striking wave-shaped structure with a glass façade, situated on the base of a former warehouse located at the Hamburg harbor @dreher2020 @hofmeister2021.
This makes Hamburg’s landmark project one of the most remarkable architectural projects recently completed in Germany @dreher2022, p. 108.
Described as a “signature building in a key location” @heuer2022, p. 90, and “tourist lighthouse” @just2022, p. 55 that was “build to compete with New York, London or Sydney” @zenker2013, p. 647 it ranks as one of the costliest concert halls ever constructed worldwide @heuer2022.
In summary, our paper makes three key contributions: (1) We contribute to the existing literature on the effects of the (post)-pandemic period in tourism research @gossling2022 @huang2023. (2) We use a robust methodological framework to address the issue of “poorly conceived methodologies” in COVID-19 and tourism research @zopiatis2021, p. 279, and (3) we enhance the empirical literature on the impact of exceptional architecture on tourism, responding to previous studies with a “rather sobering finding” @dreher2020, p. 449.
Our empirical findings suggest that, ….
In the following sections, we first outline the impact exceptional architecture can have on tourist attractiveness and highlight the challenges of measuring these effects.
We then present the case of the Elbphilharmonie in detail in Section 3, followed by an overview of the empirical analysis in Section 4.
We summarize the results in Section 4 and conclude with implications for future research on the relationship between exceptional architecture and tourism.

= Tourism and architecture

Over the past decades, tourism has evolved into one of the largest and fastest-growing industries globally, contributing significantly to the gross domestic product of many regions.
For example, in 2019, tourism revenues in Europe amounted to a substantial 514.9 billion euros @worldtourismorganization2021.
However, the pandemic triggered a sharp decline @plzakova2022 @worldtourismorganization2023, as travel restrictions, testing requirements, and quarantines created lasting travel hesitancy among some individuals @gossling2022 @mckercher2024.
Nevertheless, and despite initial pessimistic forecasts, the tourism industry is undergoing a robust recovery in most places, a phenomenon powered by and often referred to as “revenge tourism” @meenakshi2024 @vogler2022.
Motivated by a strong urge to travel once borders reopened, some travelers created ‘bucket lists’ to satisfy their craving for heightened excitement @meenakshi2024 making destinations renowned for their exceptional architecture an appealing choice.
In response to the economic relevance to attract tourists and the increasing competition among urban centers for economic development @hausler2024 @sklair2017 @zenker2013, many European cities have invested in prestigious architectural projects @andersson2014 @ponzini2020.
The underlying idea is that exceptional architecture can stimulate new tourism, employment opportunities, and additional tax revenues, which can be economically beneficial for urban growth @alaily-mattar2018a @plaza2006.
This phenomenon occurs because exceptional architecture may act as a unique selling point that contributes to the attractive image of a city and adds a layer of urban prestige @andersson2014.
As a result, these buildings often become representative symbols of urban progress, motivating tourists to choose their host cities as destinations @balke2018 @boniface2021 @scerri2019 @specht2014.
This aligns with the findings from Plaza et al. @plaza2024, who link the effects of exceptional architecture with findings from cognitive psychology and social cognition @dimaggio1997.
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
Our study builds on this assumption by using the Elbphilharmonie in Hamburg as a case study to explore the forward linkage effects @gelman2013a @hiller1998 of its inauguration to explore how exceptional architecture can influence overnight stays in the tourism sector.


= The Elbphilharmonie 

Germany, a major player in the global tourism export market @gossling2022, has experienced severe impacts from the COVID-19 pandemic, particularly in the hospitality sector.
Hotels, restaurants, and cafés have been hit hard since March 2020, with hotels, inns, and guest houses recording a 57% decline in revenue from March 2020 to January 2021 compared to the previous year @destatis2021a.
In Hamburg, the tourism and hospitality industries were especially affected, because it had previously benefited from strong business travel due to their status as major trade fair and conference locations @dehoga2022.
But Hamburg is also renowned for its architectural gem, the Elbphilharmonie.
Although business travel has not yet returned to pre-pandemic levels ibid., this relatively new addition to the city’s landscape may have become a sought-after destination, particularly following the easing of pandemic restrictions, for travelers seeking to enhance their bucket lists with unique experiences.
From the outset, the Elbphilharmonie was ascribed identity-forming characteristics and recognized for its potential socio-economic influence due to its location, as well as the exceptional visual and emotional appeal @alaily-mattar2021a.
Architecturally integrated in/on the brick corpus of a former cocoa warehouse in Hamburg’s harbor area, it is adjacent to the historic warehouse complex and UNESCO World Heritage Site ‘Speicherstadt’ @heuer2022.
The constructions were completed in November 2016 and officially opened in early January 2017. The striking design features a conspicuous iceberg/wave structure made of glass that stands 110 meters tall see picture 1.
Designed by internationally renowned architects Herzog & de Meuron, who also created the Tate Modern in London and the 'Bird's Nest' Stadium in Beijing, the building is situated in a prominent location @alaily-mattar2018, and - on par with comparable iconic architectural landmarks @ghalejough2024 - has sparked extensive media coverage.
These factors qualify it as a distinct type of exceptional architecture known as ‘star architecture’ @dreher2022.
But the Elbphilharmonie also shares another attribute often associated with star architecture – it is “expensive and controversial” @alaily-mattar2022a, p. 3.
Initially estimated at 187 million euros, the construction cost eventually rose to 866 million euros, making it one of the most expensive concert halls ever built @hofmeister2021.
During the selection process, there were some controversies, notably the awarding of the design contract to architects Herzog & de Meuron without an open bidding process or architectural competition @alaily-mattar2021a, p. 101.
From a functional perspective, the structure serves as a concert hall, which also includes a hotel and private residences.
Moreover, situated at a height of 37 meters on top of the brick corpus, it encompasses an open plaza accessible to the public, offering residents and visitors an expansive view of the city @holz2023.
By early 2024, this plaza has been experienced by over 20 million visitors @dpa2024, while within a single year until mid-2024, 852,000 tickets were sold for the concert hall @holz2024.
Nevertheless, the Elbphilharmonie project is linked to a ‘Hamburg Effect’ instead of a ‘Guggenheim Effect’.
Unlike the Guggenheim Museum in Bilbao, which was constructed as a catalyst for the regeneration of a “rundown” @heidenreich2015, p. 1441 industrial city and subsequently evolved into a major tourist attraction with tangible economic benefits and a thriving art and creative scene @plaza2009, the Elbphilharmonie was designed with the primary goal of reinforcing Hamburg’s identity as a cultural and musical hub @heuer2022.
The focus to serve the local and national population gets evident in the origin of the audience attending performances in the concert hall, where the proportion of foreign attendees has not surpassed 6%.
In contrast, approximately 60 to 70% of visitors to the Guggenheim Museum in Bilbao come from foreign countries @heuer2022, p. 97.
To study of the impact of exceptional architecture on tourism, using the Elbphilharmonie in Hamburg as an example, is beneficial in two ways.
First, the relatively low number of foreign concert attendees suggests that, if there was a positive effect, it is the architectural attraction itself rather than the concerts that attracts tourists, providing empirical support for the assumptions of @dreher2020.
Second, unlike Bilbao in the late 1990s, Hamburg did not experience similar idiosyncratic contextual influencing factors such as the rapid transformation of a rundown industrial city, end of terrorism, etc., making it more feasible to accurately estimate the effects of exceptional architecture on tourism.

// TODO: Describe data

= Data and Method

== The synthetic control method

In this paper, we use the synthetic control method @abadie2021 to assess the touristic impact of the Elbphilharmonie. 
The synthetic control method aims to answer the question of whether a discrete intervention (here, the building of the Elbphilharmonie) had a causal effect on some quantity of interest (here, visitor numbers), i.e., whether there was an increase (or decrease) in the quantity of interest which would not have occurred without the intervention.
In pursuit of this goal, the method follows a comparative case study design which contrasts the unit for which the intervention occurred (Hamburg) with a set of comparable units where the intervention didn't occur (other cities).
More specifically, the synthetic control method proceeds by constructing a weighted average of contrast cases representing a 'synthetic' version of the intervention unit.
Weights are determined in a way as to maximize the pre-intervention similarity of the synthetic and the real unit in terms of the quantity of interest. 
Given sufficient pre-intervention similarity (taken to indicate that the behaviour of the quantity of interest is well-approximated by the weighted average of the control units), post-intervention deviations between the synthetic and the real case are then interpreted as a consequence of the intervention.
Robustness of this interpretation can be assessed by conducting different kinds of placebo tests:
First, the analysis can be rerun with intervention shifted to different points in time. If these analyses yield similarly large post-intervention differences, results are likely to represent noise and should be interpreted with care.
Second, instead of shifting the timepoint of the intervention, placebos can be constructed by assigning the intervention to other units than the one for which it occurred.
If these simulations yield similarly large effects as the actually treated unit, results are again not robust.

== Selection of control cases


- robustness tests / placebo studies
- variable selection
- case selection

= Results and discussion

= Conclusion

Here is the text with citations converted to the typst format without parentheses:

This study has examined the causal effect of the inauguration of an exceptional architectural building on overnight stays in tourist accommodations, particularly in the context of post-pandemic recovery.
Our contributions to the literature are threefold.
First, we expand the scientific knowledge on the effects of the (post)-pandemic period in tourism research by contextualizing the role of exceptional architecture in tourism recovery.
Our findings illustrate that exceptional architecture can act as catalysts for revitalizing urban tourism and sustaining long-term visitor engagement.
Second, by employing a synthetic control method, we introduce a robust econometric framework for evaluating large-scale interventions, addressing concerns about “poorly conceived methodologies” in tourism research @zopiatis2021, p. 279.
This methodological approach not only strengthens causal inference but also establishes a replicable model for future studies in regional tourism analysis.
Third, we contribute to the empirical literature on the impact of exceptional architecture on tourism, addressing previous studies with mixed findings or cases influenced by a synergy of multiple contextual factors affecting tourism development.
By applying this rigorous methodology, we reconstructed the counterfactual trajectory that tourism in Hamburg would have followed in the absence of the Elbphilharmonie’s construction.

We constructed a control group from XXX ….

This approach enables a more precise assessment of its true impact, providing valuable insights for urban planners, policymakers, and scholars interested in the intersection of architecture and regional economic development.

“despite possible increase in the inauguration year, star architecture can have quite short-lived quantitative media effects.” @alaily-mattar2020, p. 97

Our findings show a positive effect of the Elbphilharmonie on overnight stays even 8 years after its inauguration

Given that the effects of exceptional architecture extend beyond economic considerations @alaily-mattar2022a, further research could integrate our findings into discussions on its potential to reshape cultural and urban identity @heidenreich2015; @mcneill2000, act as a trigger for innovation @dreher2022, serve as a symbol of change and influence institutional work @lawrence2015, function as a focal point for negotiating norms and standards @grubbauer2022, and ultimately emerge as a ‘field-configuring place’ @capron2024.

Critique exceptional architecture?:

However, the creation of exceptional architecture is not without its critiques, as such buildings often embody and project power to maximize commercial gains for the capitalist elite @sklair2006.

These architectural works can be co-opted to publicly legitimize and politically enforce the underlying projects, making them essential components of a post-political regime characterized by neoliberal governmentality @balke2018, p. 997, reflecting a broader societal trend toward the commercialization of increasingly diverse aspects of our life @hausler2024, p. 225.
