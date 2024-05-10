package main

type Sheet struct{}

func (s *Sheet) accept(v Visitor) {
	v.visitSheet(s)
}

func (t *Sheet) getType() string {
	return "Sheet"
}
