package main

import "fmt"

type DolarPayment struct {
	dolar Dolar
}

func (dp *DolarPayment) pay() {
	fmt.Printf("Pagamento em dolar: %.2f\n", dp.dolar.value)
}
