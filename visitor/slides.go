package main

type Slide struct{}

func (s *Slide) accept(v Visitor) {
	v.visitSlide(s)
}

func (s *Slide) getType() string {
	return "Slide"
}
