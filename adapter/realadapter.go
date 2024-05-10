package main

type RealAdapter struct {
	real *Real
}

func (ra *RealAdapter) pay() {
	println("Convertendo valor para dolar")
	d := Dolar{value: ra.real.value * 2}
	dp := DolarPayment{dolar: d}
	dp.pay()
}
