# load Rmarkdown
library(rmarkdown)


# Render individual documents
render(input = "dyn_docs_demo.Rmd", output_format = "html_document")
#render(input = "dyn_docs_demo.Rmd", output_format = "word_document")
#render(input = "dyn_docs_demo.Rmd", output_format = "pdf_document")


# or render all the formats at once
 #render(input = "dyn_docs_demo.Rmd", output_format = "all")