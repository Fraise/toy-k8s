package main

import (
	"fmt"
	"io"
	"log"
	"net/http"

	"github.com/go-chi/chi/v5"
	"github.com/go-chi/chi/v5/middleware"
)

func main() {
	r := chi.NewRouter()
	r.Use(middleware.Logger)
	r.Get("/", func(w http.ResponseWriter, r *http.Request) {
		c := new(http.Client)
		resp, err := c.Get("http://super-backend:8080/super")
		if err != nil {
			log.Printf("error querrying super backend: %v", err)
		}
		defer func() {
			err = resp.Body.Close()
			if err != nil {
				log.Printf("error closing response body: %v", err)
			}
		}()

		bytes, err := io.ReadAll(resp.Body)
		if err != nil {
			log.Printf("error reading super backend response: %v", err)
		}

		_, err = w.Write([]byte(fmt.Sprintf("super backend says: %s", bytes)))
		if err != nil {
			log.Printf("error writing response: %v", err)
		}
	})

	err := http.ListenAndServe(":8080", r)
	if err != nil {
		log.Printf("error starting web server: %v", err)
	}
}
