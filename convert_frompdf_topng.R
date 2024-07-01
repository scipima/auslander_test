library(pdftools)

pdf_file <- here::here("data_in", "pdf", "FS-1-2-Auslä-1987.pdf")
pdftools::pdf_convert(
    pdf = pdf_file, format = "png", 
    pages = seq(from = 45, to = 63, by = 2), dpi = 600,     
)

