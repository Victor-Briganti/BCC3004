package main

type Text struct{}

func (t *Text) accept(v Visitor) {
	v.visitText(t)
}

func (t *Text) getType() string {
	return "Text"
}
