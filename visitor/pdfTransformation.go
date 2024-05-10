package main

import (
	"fmt"
)

type PdfTransformation struct{}

func (a *PdfTransformation) visitText(t *Text) {
	fmt.Println("Transformando texto para PDF")
}

func (a *PdfTransformation) visitSheet(s *Sheet) {
	fmt.Println("Transformando planilhas para PDF")
}
func (a *PdfTransformation) visitSlide(s *Slide) {
	fmt.Println("Transformando slides para PDF")
}
