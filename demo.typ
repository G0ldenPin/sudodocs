#import "lib.typ": project, img //img is an extra function for easy image alignment

#show: project.with(
  title: "sudo_docs Template",
  subtitle: "for beautiful comp-sci notes",
  author: ("John Smith", "Jane Doe"), // you can list multiple authors
  affiliation: "university",
  year: "2025", 
  toc: true, // enable Table of Contents
  
  // COLOR THEME: change this to customize the look!
  // try: rgb("#003366") for Navy Blue, or rgb("#006400") for Green
  main-color: rgb("#4d1d14"), 
  
  // add your logo path here (e.g., "logo.png") or set to none
  logo: "logo.png"
)

// --- CONTENT STARTS HERE ---

= Introduction
Welcome to *sudo_docs*, a minimalist, code-centric Typst template designed for Computer Science students who also happen to like having clean, colorful notes. 

This document demonstrates the visual style and capabilities of the template. The font used for the text is *IBM Plex Mono*, giving it a distinctive "terminal" look, while the code blocks use *Fira Code* (or *Cascadia Code*) for better readability.

== How to use this template
To use this template, simply import it at the top of your `.typ` file:

```typst
#import "sudodocs.typ": project

#show: project.with(
  title: "My Project",
  author: "My Name",
  toc: true,
  main-color: rgb("#4d1d14") // optional custom color
)
```

== Lists
The lists are styled according to the main color of the template, that is customable at line 13 through a RGB code.

- First item
- Second item
- Third item

+ First item
+ Second item
+ Third item

== Code

Here is an example of inline code: `var x int`. For code blocks:

```go
func main() {
    fmt.Println("hello world")
}
```

The code block has a stroke that matches the main color of the template that you can modify.

// this is a pagebreak. If you don't like how the auto-layout lays your text, give it some more 
// space by moving it to the next page!
#pagebreak() 

== Image alignment

This is a short tutorial on how to use the img function:
- The image automatically centers if you don't specify any parameters;
#img("logo.png", width: 4cm, alt:"alt text here", desc:"centered image")

- You can align an image to the left using the *pos* (position) and *width* parameters. You can define size and position easily instead of using typst functions easily.
#img("logo.png", width: 4cm, pos: left) 
#img("logo.png", width: 4cm, pos: right)

Description for images is only available for centered images due to space requirements.

This is an easy way to sign documents or add specific smaller images such as icons or small code snippets from your IDE.

= Done!
#lorem(30)