#show figure: set block(breakable: true)
#figure( // start preamble figure
  
  kind: "tinytable",
  supplement: "Table", // end preamble figure

block[ // start block

  #let style-dict = (
    // tinytable style-dict after
  )

  #let style-array = ( 
    // tinytable cell style after
  )

  // Helper function to get cell style
  #let get-style(x, y) = {
    let key = str(y) + "_" + str(x)
    if key in style-dict { style-array.at(style-dict.at(key)) } else { none }
  }

  // tinytable align-default-array before
  #let align-default-array = ( left, left, left, left, left, ) // tinytable align-default-array here
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
    columns: (auto, auto, auto, auto, auto),
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
 table.hline(y: 1, start: 0, end: 5, stroke: 0.05em + black),
 table.hline(y: 23, start: 0, end: 5, stroke: 0.1em + black),
 table.hline(y: 0, start: 0, end: 5, stroke: 0.1em + black),
    // tinytable lines before

    // tinytable header start
    table.header(
      repeat: true,
[unit], [mspe_ratio], [loo_pretreatment_mspe], [avg_loo_treatment_effect], [relative_to_baseline],
    ),
    // tinytable header end

    // tinytable cell content after
[Hamburg], [65.41], [NA], [NA], [NA],
[Rotterdam], [53.92], [67227], [149787], [0.12],
[Bremen], [24.38], [67227], [149731], [0.12],
[Kopenhagen], [17.32], [67543], [140289], [0.05],
[Dortmund], [14.07], [67530], [142327], [0.06],
[Bonn], [12.72], [66190], [134009], [0.00],
[Bochum], [8.51], [66263], [143707], [0.07],
[Amsterdam], [7.84], [67624], [162363], [0.21],
[Münster], [7.17], [67516], [138908], [0.04],
[Bielefeld], [5.49], [67536], [139391], [0.04],
[Duisburg], [4.49], [67233], [148259], [0.11],
[München], [4.08], [67233], [148437], [0.11],
[Köln], [3.82], [67218], [137141], [0.02],
[Nürnberg], [3.27], [67230], [148973], [0.11],
[Helsinki], [2.94], [67893], [146854], [0.09],
[Stuttgart], [2.62], [67624], [162373], [0.21],
[Wuppertal], [2.38], [67561], [141683], [0.06],
[Hannover], [1.72], [67227], [149741], [0.12],
[Berlin], [1.56], [243667], [18114], [-0.86],
[Bremerhaven], [1.43], [67252], [147687], [0.10],
[Essen], [0.68], [67227], [149706], [0.12],
[Düsseldorf], [0.56], [68458], [140552], [0.05],

    // tinytable footer after

  ) // end table

  ]) // end align

] // end block
) // end figure
