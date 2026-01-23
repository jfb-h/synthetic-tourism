#show figure: set block(breakable: true)
#figure( // start preamble figure
  
  kind: "tinytable",
  supplement: "Table", // end preamble figure

block[ // start block

  #let style-dict = (
    // tinytable style-dict after
    "0_0": 0, "0_1": 0, "0_2": 0, "0_3": 0, "1_0": 1, "2_0": 1, "3_0": 1, "4_0": 1, "5_0": 1, "6_0": 1, "7_0": 1, "8_0": 1, "9_0": 1, "10_0": 1, "11_0": 1, "12_0": 1, "13_0": 1, "14_0": 1, "15_0": 1, "16_0": 1, "17_0": 1, "19_0": 1, "20_0": 1, "21_0": 1, "22_0": 1, "23_0": 1, "1_1": 2, "2_1": 2, "3_1": 2, "4_1": 2, "5_1": 2, "6_1": 2, "7_1": 2, "8_1": 2, "9_1": 2, "10_1": 2, "11_1": 2, "12_1": 2, "13_1": 2, "14_1": 2, "15_1": 2, "16_1": 2, "17_1": 2, "19_1": 2, "20_1": 2, "21_1": 2, "22_1": 2, "23_1": 2, "1_2": 2, "2_2": 2, "3_2": 2, "4_2": 2, "5_2": 2, "6_2": 2, "7_2": 2, "8_2": 2, "9_2": 2, "10_2": 2, "11_2": 2, "12_2": 2, "13_2": 2, "14_2": 2, "15_2": 2, "16_2": 2, "17_2": 2, "19_2": 2, "20_2": 2, "21_2": 2, "22_2": 2, "23_2": 2, "1_3": 2, "2_3": 2, "3_3": 2, "4_3": 2, "5_3": 2, "6_3": 2, "7_3": 2, "8_3": 2, "9_3": 2, "10_3": 2, "11_3": 2, "12_3": 2, "13_3": 2, "14_3": 2, "15_3": 2, "16_3": 2, "17_3": 2, "19_3": 2, "20_3": 2, "21_3": 2, "22_3": 2, "23_3": 2, "18_0": 3, "18_1": 4, "18_2": 4, "18_3": 4
  )

  #let style-array = ( 
    // tinytable cell style after
    (align: center,),
    (align: left,),
    (align: right,),
    (background: rgb("#E5E5E5"), align: left,),
    (background: rgb("#E5E5E5"), align: right,),
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
 table.hline(y: 1, start: 1, end: 2, stroke: 0.05em + black), table.hline(y: 1, start: 2, end: 4, stroke: 0.05em + black),
 table.hline(y: 2, start: 0, end: 4, stroke: 0.05em + black),
 table.hline(y: 24, start: 0, end: 4, stroke: 0.1em + black),
 table.hline(y: 0, start: 0, end: 4, stroke: 0.1em + black),
    // tinytable lines before

    // tinytable header start
    table.header(
      repeat: true,
[ ], [Pre / post intervention comparison], table.cell(colspan: 2, align: center)[Leave-one-out test (LOO)],
[City], [RMSPE ratio], [Pre-intervetion RMSPE], [Treatment Effect],
    ),
    // tinytable header end

    // tinytable cell content after
[Hamburg], [51.03], [70,355], [18,127,946],
[Rotterdam], [43.56], [70,355], [18,128,204],
[Bremen], [32.3], [70,355], [18,127,746],
[Helsinki], [10.97], [70,355], [18,127,769],
[Bochum], [9.98], [70,355], [18,129,056],
[Köln], [9.07], [67,157], [15,040,720],
[Nürnberg], [8.78], [70,355], [18,127,842],
[Dortmund], [8.53], [70,354], [18,129,988],
[Hannover], [6.09], [67,228], [16,430,435],
[Kopenhagen], [5.29], [73,892], [16,198,899],
[Münster], [4.37], [70,354], [18,128,126],
[Amsterdam], [4.29], [70,355], [18,128,434],
[München], [3.79], [70,355], [18,129,079],
[Bielefeld], [3.09], [70,355], [18,128,320],
[Bonn], [2.51], [70,355], [18,128,235],
[Duisburg], [1.85], [70,355], [18,129,146],
[Berlin], [1.56], [249,660], [3,214,405],
[Wuppertal], [1.47], [70,355], [18,127,804],
[Bremerhaven], [1.27], [70,355], [18,129,305],
[Düsseldorf], [1.01], [68,505], [15,283,764],
[Stuttgart], [0.95], [70,725], [18,638,253],
[Essen], [0.93], [70,355], [18,128,364],

    // tinytable footer after

    table.footer(
      repeat: false,
      // tinytable notes after
    table.cell(align: left, colspan: 4, text([Pre-intervention RMSPE and treatment effect for Hamburg refer to the baseline estimate.])),
    ),
    

  ) // end table

  ]) // end align

] // end block
) // end figure
