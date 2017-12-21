package app

import (
	"github.com/gorilla/mux"
	"net/http"
)

func Run() {
	boardController := &BoardController{}

	router := mux.NewRouter()

	router.HandleFunc("/{board}/", boardController.ShowBoard).Methods("GET")
	router.HandleFunc("/{board}/", boardController.AddThread).Methods("POST")
	router.HandleFunc("/{board}/{thread}", boardController.ShowThread).Methods("GET")
	router.HandleFunc("/{board}/{thread}", boardController.AddPost).Methods("POST")

	http.ListenAndServe(":1337", router)
}