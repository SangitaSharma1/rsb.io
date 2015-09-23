GOCC := go
ESC := esc
HUGO := hugo
PORT := 8080

define goserver
package main

import "net/http"
import "log"
import "runtime"

var _ = runtime.GOMAXPROCS(runtime.NumCPU())

func main() {
	http.Handle("/", http.FileServer(FS(false)))
	log.Println("Listening on port 8080")
	log.Println("Running ", runtime.GOMAXPROCS(0), "Procs: ")
	log.Fatal(http.ListenAndServe(":8080", nil))
}
endef
export goserver

.PHONY: all server static clean deploy

all: static server

deploy:
	aws s3 sync --exclude 'talks/*' --exclude 'public/*' --exclude '.git/*' --exclude Makefile --exclude rsbio --exclude content.go . s3://input.rsb.io/

server: static main.go
	$(ESC) -o content.go -pkg main -prefix public public
	$(GOCC) build -o rsbio

main.go:
	echo "$$goserver" > main.go

static:
	@$(HUGO)

clean:
	rm -rf *.go public rsbio
