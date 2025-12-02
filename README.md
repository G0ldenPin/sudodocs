# sudodocs
sudodocs is a minimalist, code-centric Typst template designed for Computer Science students who also happen to like having clean, colorful notes. 

## Features

**img()** helper for images (alignment, captions, alt text).

```
img("img.png", width: 60%, desc: "Example image")
```


**project()** handles the full document layout:

- Cover page (title, subtitle, authors, affiliation, year, logo)

- A4 layout and margins

- IBM Plex Mono typography

- Optional table of contents (toc: true)

- Colored and numbered headings

- Styled code blocks (Cascadia Code)

- Dynamic page headers showing the current section

## Usage
```
#import "lib.typ": project, img 

#show: project.with(
  title: "sudo_docs Template",
  subtitle: "for beautiful comp-sci notes",
  author: ("John Smith", "Jane Doe"), 
  affiliation: "university",
  year: "2025", 
  toc: true,
  main-color: rgb("#4d1d14"), 
  logo: none
)
```

## Requirements

Typst (latest)

Fonts: IBM Plex Mono, Cascadia Code