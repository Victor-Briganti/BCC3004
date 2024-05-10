package main

func main() {
	real := &Real{value: 100.50}
	realPayment := &RealPayment{real: *real}
	realPayment.pay()
	realAdapter := &RealAdapter{real: real}
	realAdapter.pay()
}
