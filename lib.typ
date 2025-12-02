// custom function for image alignment, description and alt text
#let img(path, width: 80%, pos: center, desc: none, alt: none) = {
  let alt-text = if alt != none { alt } else { desc }
  let img-content = image(path, width: width, alt: alt-text)

  if desc != none {
    align(pos, figure(
      img-content,
      caption: desc,
      numbering: "1", 
      kind: image
    ))
  } else {
    align(pos, img-content)
  }
}

#let project(
  title: "",
  subtitle: "",
  author: "",
  affiliation: "", 
  year: "",
  logo: none,
  toc: false,
  main-color: rgb("#4d1d14"),
  body
) = {

  let authors-list = if type(author) == array { author } else { (author,) }
  let authors-string = authors-list.join(", ")

  // docs settings
  set document(author: authors-list, title: title)
  set page(paper: "a4", margin: (top: 3cm, bottom: 2.5cm, x: 2cm))
  set text(font: "IBM Plex Mono", size: 11pt)

  set heading(numbering: "1.1.")

  // list style
  set list(marker: text(fill: main-color)[•])
  set enum(numbering: (n) => text(fill: main-color)[#n.])

  show heading: set text(fill: main-color, weight: "bold")
  show heading: set block(above: 1.5em, below: 1em)

  // code style
  show raw.where(block: true): it => {
    block(
      fill: luma(240),
      inset: 12pt,
      radius: 4pt,
      width: 100%,
      stroke: (left: 4pt + main-color), 
      {
        show raw: set text(font: "Cascadia Code", size: 10pt)
        set par(justify: false)
        raw(it.text, lang: it.lang, block: false)
      }
    )
  }

  // cover
  page(header: none, footer: none)[
    #set align(center + horizon)
    
    #if logo != none {
      if type(logo) == str { image(logo, width: 30%) } else { logo }
      v(2em)
    }

    #text(size: 24pt, weight: "bold", fill: main-color)[#title]
    #v(1em)
    #text(size: 16pt, style: "italic")[#subtitle]
    
    #v(2em)
    #line(length: 50%, stroke: 2pt + main-color)
    #v(2em)
    
    #text(size: 14pt, weight: "bold")[#authors-string] \
    #v(0.5em)
    
    #if affiliation != "" [
      #text(size: 12pt, style: "italic")[#affiliation]
      #v(0.5em)
    ]
    
    #text(size: 12pt)[#year]
  ]

  // toc
  if toc {
    pagebreak() 
    show outline.entry: set text(font: "IBM Plex Mono")
    
    // auto language titling
    outline(title: auto, indent: auto, depth: 3)
    
    pagebreak(weak: true)
  }

  set page(
    numbering: "1", 
    number-align: right,
    
    header: context { // dynamic upper heading 
      let before = query(selector(heading.where(level: 1)).before(here()))
      let after = query(selector(heading.where(level: 1)).after(here()))
      let current-heading = none
      
      if before.len() > 0 {
        current-heading = before.last()
      } else if after.len() > 0 {
        let first-after = after.first()
        if first-after.location().page() == here().page() {
          current-heading = first-after
        }
      }
      if current-heading != none {
        align(right)[
          #text(size: 9pt, style: "italic", fill: main-color)[
            #if current-heading.numbering != none {
              numbering(current-heading.numbering, ..counter(heading).at(current-heading.location()))
              [ ] 
            }
            #current-heading.body
          ]
          #v(-8pt)
          #line(length: 100%, stroke: 0.5pt + main-color.lighten(40%))
        ]
      }
    }
  )
  
  counter(page).update(1)
  
  body
}