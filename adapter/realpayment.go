package main

import "fmt"

type RealPayment struct {
	real Real
}

func (rp *RealPayment) pay() {
	fmt.Printf("Pagamento em real: %.2f\n", rp.real.value)
}
