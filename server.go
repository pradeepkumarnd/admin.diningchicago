package main

import (
  "github.com/go-martini/martini"
  "github.com/martini-contrib/gorelic"
)

func main() {
  m := martini.Classic()
  gorelic.InitNewrelicAgent("a3f77352eb35c9426431539d5f766b0bbeabdc3e", "Diningchicago Admin", true)
  m.Use(gorelic.Handler)

  m.Get("/", func() string {
    return "Hello world!"
  })
  m.Run()
}
