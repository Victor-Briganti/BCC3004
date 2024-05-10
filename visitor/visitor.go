package main

type Visitor interface {
	visitText(*Text)
	visitSlide(*Slide)
	visitSheet(*Sheet)
}
