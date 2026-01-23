#show table.cell.where(y: 0): strong

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
      [Mean Control cases],
    ),
    table.hline(),
    [Overn. stays 2007-2011 Q1], [1,654,918], [1,659,182], [681,325],
    [Overn. stays 2007-2011 Q2], [2,234,093], [2,226,265], [864,132],
    [Overn. stays 2007-2011 Q3], [2,444,491], [2,428,994], [960,991],
    [Overn. stays 2007-2011 Q4], [2,025,721], [2,086,033], [836,028],
    [GDP 2005-2009], [53,460], [53,403], [44,821],
    [POP 2014-2016], [1,765,514], [1,539,810], [849,368],
    table.hline(), 
    table.footer(table.cell(text(style: "italic", size: 10pt)[
        Note: All values are avereages over the indicated period. Synthetic Hamburg is the weighted avereage of control cases using the optimized weights (where Berlin, Bonn, Düsseldorf, Cologne, and Amsterdam were selected as relevant donors), while the control cases column reports the simple average.
    ], colspan: 4))
  )
)

