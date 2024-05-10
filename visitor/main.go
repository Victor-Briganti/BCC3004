package main

func main() {
	text := &Text{}
	slide := &Slide{}
	sheet := &Sheet{}

	pdf := &PdfTransformation{}

	text.accept(pdf)
	slide.accept(pdf)
	sheet.accept(pdf)
}
