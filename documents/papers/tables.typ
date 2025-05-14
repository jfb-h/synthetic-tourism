#show table.cell.where(y: 0): strong

// #let table1 = figure(
//   scope: "parent",
//   placement: top,
  
//   table(
//     columns: (3fr, 1fr, 1fr, 2fr, 2fr),
//     align: (left, center, center, center, center),
//     stroke: none,
//     table.hline(), 
//     table.header([], [Units], [Sites], [Formal scouts], [Informal scouts],),
//     [], [$N$], [$N$], [$N$ (%)], [$N$ (%)],
//     table.hline(),
    
//     [#v(0.2em) _Divisions_ #v(0.2em)],[], [], [], [], 
//     [#h(0.4em) Business divisions ($N=4$)],[11], [59], [50 (27.6)], [131 (72.4)], 
//     [#h(0.4em) Research divisions ($N=4$)],[24], [53], [86 (34.4)], [164 (65.6)], 
    
//     [#v(0.2em) _Regions_ #v(0.2em)],[], [], [], [], 
//     [#h(0.4em) Europe (EU)],[30], [33], [84 (30.1)], [195 (69.9)], 
//     [#h(0.4em) North America (NA)],[19], [17], [30 (34.5)], [57 (65.5)], 
//     [#h(0.4em) South America (SA)],[9], [5], [6 (28.6)], [15 (71.4)], 
//     [#h(0.4em) Asia & Pacific (AP)],[12], [9], [16 (36.4)], [28 (73.6)], 
//     table.hline(),
//     table.footer(table.cell(text(style: "italic", size: 10pt)[
//       Note: Columns one and two indicate the number of distinct units and sites where scouts are found.
//     ], colspan: 5))
//   ),
//   caption: figure.caption([Organizational and regional composition], position: top)
// )

#let table1 = figure(
  scope: "parent",
  placement: top,
  
  caption: figure.caption(position: top,[Pre-intervention comparison of selected predictors]),
  
  table(
    columns: (1.5fr, 1fr, 1fr, 1fr),
    align: (left, right, right, right),
    stroke: none,
    table.hline(), 
    table.header(
      [Variable],
      [Hamburg],
      [Synthetic Hamburg],
      [Control cases],
    ),
    table.hline(), 
    // [Overn. stays 1998-2001 Q1], [1,000,424], [974,827], [483,916],
    // [Overn. stays 1998-2001 Q2], [1,263,324], [1,325,977], [602,773],
    // [Overn. stays 1998-2001 Q3], [1,323,960], [1,361,045], [654,637],
    // [Overn. stays 1998-2001 Q4], [1,158,228], [1,172,869], [564,478],
    // [Overn. stays 2002-2006 Q1], [1,213,517], [1,175,367], [535,158],
    // [Overn. stays 2002-2006 Q2], [1,611,526], [1,618,570], [680,501],
    // [Overn. stays 2002-2006 Q3], [1,718,877], [1,706,861], [737,106],
    // [Overn. stays 2002-2006 Q4], [1,486,438], [1,472,100], [647,172],
    [Overn. stays 2007-2011 Q1], [1,654,918], [1,659,182], [681,325],
    [Overn. stays 2007-2011 Q2], [2,234,093], [2,226,265], [864,132],
    [Overn. stays 2007-2011 Q3], [2,444,491], [2,428,994], [960,991],
    [Overn. stays 2007-2011 Q4], [2,025,721], [2,086,033], [836,028],
    // [Overn. stays 2012-2016 Q1], [2,346,738], [2,382,061], [907,143],
    // [Overn. stays 2012-2016 Q2], [3,211,565], [3,145,408], [1,152,838],
    // [Overn. stays 2012-2016 Q3], [3,527,371], [3,445,873], [1,264,583],
    // [Overn. stays 2012-2016 Q4], [2,957,446], [2,969,446], [1,104,662],
    // [GDP 2000-2004], [49,040], [48,214], [39,992],
    [GDP 2005-2009], [53,460], [53,403], [44,821],
    // [GDP 2010-2014], [56,700], [56,349], [48,141],
    // [GDP 2015-2016], [61,150], [59,166], [51,905],
    [EW 2014-2016], [1,765,514], [1,539,810], [849,368],
    table.hline(), 
    table.footer(table.cell(text(style: "italic", size: 10pt)[
        Note: All values are avereages over the indicated period. Synthetic Hamburg is the weighted avereage of control cases using the optimized weights, while the control cases column reports the simple average.
    ], colspan: 4))
  )
)

//    variable           Hamburg synthetic_Hamburg donor_sample
//    <chr>                <dbl>             <dbl>        <dbl>
//  1 stays_1998_2001_1 1000424.           974827.      483916.
//  2 stays_1998_2001_2 1263324           1325977.      602773.
//  3 stays_1998_2001_3 1323960.          1361045.      654637.
//  4 stays_1998_2001_4 1158228.          1172869.      564478.
//  5 stays_2002_2006_1 1213517.          1175367.      535158.
//  6 stays_2002_2006_2 1611526           1618570.      680501.
//  7 stays_2002_2006_3 1718877.          1706861.      737106.
//  8 stays_2002_2006_4 1486438.          1472100.      647172.
//  9 stays_2007_2011_1 1654918.          1659182.      681325.
// 10 stays_2007_2011_2 2234093           2226265.      864132.
// 11 stays_2007_2011_3 2444491.          2428994.      960991.
// 12 stays_2007_2011_4 2025721.          2086033.      836028.
// 13 stays_2012_2016_1 2346738.          2382061.      907143.
// 14 stays_2012_2016_2 3211565           3145408.     1152838.
// 15 stays_2012_2016_3 3527371.          3445873.     1264583.
// 16 stays_2012_2016_4 2957446           2969446.     1104662.
// 17 gdp_2000_2004       49040             48214.       39992 
// 18 gdp_2005_2009       53460             53403.       44821.
// 19 gdp_2010_2014       56700             56349.       48141.
// 20 gdp_2015_2016       61150             59166.       51905.
// 21 ew_2014_2016      1765514.          1539810.      849368.


//  variable            weight
//  stays_2002_2006_4 0.203 
//  stays_1998_2001_4 0.134 
//  stays_2012_2016_2 0.101 
//  stays_2002_2006_3 0.0938
//  stays_2007_2011_4 0.0907
//  stays_2012_2016_4 0.0783
//  gdp_2005_2009     0.0699
//  stays_1998_2001_3 0.0632
//  stays_2007_2011_1 0.0552
//  stays_1998_2001_1 0.0516