#let template(
  title: none,
  authors: (),
  affiliations: (),
  abstract: none,
  keywords: (),
  references: "references.bib",
  body
) = {
  set page(
    paper: "a4",
    columns: 2,
    numbering: "1",
    margin: (x: 60pt, y: auto),
  )
  set par(justify: true)
  set text(
    font: "Libertinus Serif",
    size: 11pt,
  )

  show heading.where(level: 1): set heading(numbering: "1")
  show heading.where(level: 2): set text(12pt, weight: "bold")
  show heading.where(body: [References]): set heading(numbering: none)
  
  show figure.caption: set text(size: 10pt)
  // show figure.caption: set align(left)

  let count = authors.len()
  let ncols = calc.min(count, 3)
  
  place(
    top + center,
    scope: "parent",
    float: true,
    text(17pt)[
      #title
      
      #v(1em)
      
      #grid(
        columns: (1fr,) * ncols,
        column-gutter: 1em,
        row-gutter: 24pt,
        ..authors.map(author => text(11pt)[
          *#author.name* \
          #author.affiliation \
          #link("mailto:" + author.email)
        ]),
      )
      
      #v(1em)
    ],
  )

  set align(left)
    
  text(weight: "semibold")[
    _Abstract._
    #abstract
  ]

  body

  bibliography(references, title: "References", style: "egg.csl")
}
