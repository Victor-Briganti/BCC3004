package main

type Document interface {
	getType() string
	accept(Visitor)
}
