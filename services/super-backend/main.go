package main

import (
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/super", func(w http.ResponseWriter, r *http.Request) {
		_, err := w.Write([]byte("Super!"))
		if err != nil {
			log.Printf("error writing response: %v", err)
		}
	})

	err := http.ListenAndServe(":8080", r)
	if err != nil {
		log.Printf("error starting web server: %v", err)
	}
}
