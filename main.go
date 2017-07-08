package main

import (
	"database/sql"
	"encoding/json"
	"log"
	"net/http"

	"github.com/gorilla/mux"
	_ "github.com/mattn/go-sqlite3"
)

// Estrutura das Seasons
type Season struct {
	ID    int    `json:"id"`
	Title string `json:"title,omitempty"`
	Theme string `json:"theme,omitempty"`
	Year  int    `json:"year,omitempty"`
}

// Return All Seasons from Power Rangers
func getSeasonsEndpoint(w http.ResponseWriter, req *http.Request) {

	var seasons []Season

	db := dbFactory()

	rows, err := db.Query("SELECT id_season, title, theme, year FROM season")

	if err != nil {
		log.Fatal(err)
	}

	defer rows.Close() //Close DB

	//Interação nas Rows retornadas
	for rows.Next() {

		var id int
		var title string
		var theme string
		var year int

		err = rows.Scan(&id, &title, &theme, &year)
		if err != nil {
			log.Fatal(err)
		}

		seasons = append(seasons, Season{ID: id, Title: title, Theme: theme, Year: year})

	}

	err = rows.Err()

	if err != nil {
		log.Fatal(err)
	}

	// Return JSON encode
	json.NewEncoder(w).Encode(seasons)
}

// Factory do conector com o banco
func dbFactory() sql.DB {
	db, err := sql.Open("sqlite3", "./rangers.db")
	if err != nil {
		log.Fatal(err)
	}
	return *db
}

//Router Handler
func main() {
	router := mux.NewRouter()
	router.HandleFunc("/season", getSeasonsEndpoint).Methods("GET")

	log.Fatal(http.ListenAndServe(":8080", router))
}
