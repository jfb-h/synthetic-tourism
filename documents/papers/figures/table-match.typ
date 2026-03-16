#show figure: set block(breakable: true)
#figure( // start preamble figure
  
  kind: "tinytable",
  supplement: "Table", // end preamble figure

block[ // start block

  #let style-dict = (
    // tinytable style-dict after
    "0_0": 0, "1_0": 0, "2_0": 0, "3_0": 0, "4_0": 0, "5_0": 0, "6_0": 0, "0_1": 1, "1_1": 1, "2_1": 1, "3_1": 1, "4_1": 1, "5_1": 1, "6_1": 1, "0_2": 1, "1_2": 1, "2_2": 1, "3_2": 1, "4_2": 1, "5_2": 1, "6_2": 1, "0_3": 1, "1_3": 1, "2_3": 1, "3_3": 1, "4_3": 1, "5_3": 1, "6_3": 1
  )

  #let style-array = ( 
    // tinytable cell style after
    (align: left,),
    (align: right,),
  )

  // Helper function to get cell style
  #let get-style(x, y) = {
    let key = str(y) + "_" + str(x)
    if key in style-dict { style-array.at(style-dict.at(key)) } else { none }
  }

  // tinytable align-default-array before
  #let align-default-array = ( left, left, left, left, ) // tinytable align-default-array here
  #show table.cell: it => {
    if style-array.len() == 0 { return it }
    
    let style = get-style(it.x, it.y)
    if style == none { return it }
    
    let tmp = it
    if ("fontsize" in style) { tmp = text(size: style.fontsize, tmp) }
    if ("color" in style) { tmp = text(fill: style.color, tmp) }
    if ("indent" in style) { tmp = pad(left: style.indent, tmp) }
    if ("underline" in style) { tmp = underline(tmp) }
    if ("italic" in style) { tmp = emph(tmp) }
    if ("bold" in style) { tmp = strong(tmp) }
    if ("mono" in style) { tmp = math.mono(tmp) }
    if ("strikeout" in style) { tmp = strike(tmp) }
    if ("smallcaps" in style) { tmp = smallcaps(tmp) }
    tmp
  }

  #align(center, [

  #table( // tinytable table start
    columns: (auto, auto, auto, auto),
    stroke: none,
    rows: auto,
    align: (x, y) => {
      let style = get-style(x, y)
      if style != none and "align" in style { style.align } else { left }
    },
    fill: (x, y) => {
      let style = get-style(x, y)
      if style != none and "background" in style { style.background }
    },
 table.hline(y: 1, start: 0, end: 4, stroke: 0.05em + black),
 table.hline(y: 7, start: 0, end: 4, stroke: 0.1em + black),
 table.hline(y: 0, start: 0, end: 4, stroke: 0.1em + black),
    // tinytable lines before

    // tinytable header start
    table.header(
      repeat: true,
[Variable], [Hamburg], [Synthetic Hamburg], [Donor pool mean],
    ),
    // tinytable header end

    // tinytable cell content after
[stays_2010_2011_1], [1,771,832], [1,845,242], [724,781],
[stays_2010_2011_2], [2,498,832], [2,428,625], [940,217],
[stays_2010_2011_3], [2,716,609], [2,648,949], [1,057,967],
[stays_2010_2011_4], [2,250,692], [2,329,089], [913,615],
[pop_2009_2010], [1,773,162], [1,586,950], [714,265],
[gdp_2005_2009], [53,460], [51,122], [44,821],

    // tinytable footer after

    table.footer(
      repeat: false,
      // tinytable notes after
    table.cell(align: left, colspan: 4, text([Note: All values are averages over the indicated period. Synthetic Hamburg is the weighted average of control cases using the optimized weights (where Berlin, Düsseldorf, Cologne, Stuttgart, and Hannover were selected as relevant donors), while the last column reports the simple average of all donors.])),
    ),
    

  ) // end table

  ]) // end align

] // end block
) // end figure
