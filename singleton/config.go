package main

import "sync"

type ConfigManager struct {
	val int
}

var (
	instance *ConfigManager
	// sync.Once é um primitivo de go que permite uma inicialização única de um objeto
	once sync.Once
)

func getInstace() *ConfigManager {
	once.Do(func() {
		instance = &ConfigManager{val: 5}
		println("Criado config Manager")
	})
	return instance
}
