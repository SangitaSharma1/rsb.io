GOCC := go
ESC := esc
HUGO := hugo
PORT := 8080

.PHONY: all gobin static clean

all: static gobin

gobin: main.go
	$(ESC) -o content.go -pkg main -prefix public public
	$(GOCC) build -o rsbio

main.go:
	@echo "package main" > main.go
	@echo 'import "net/http"' >> main.go
	@echo 'import "log"' >> main.go
	@echo "func main() {" >> main.go
	@echo "	http.Handle(\"/\", http.FileServer(FS(false)))" >> main.go
	@echo "	log.Println(\"Listening on port $(PORT)\")" >> main.go
	@echo "	log.Fatal(http.ListenAndServe(\":$(PORT)\", nil))" >> main.go
	@echo "}" >> main.go

static:
	@$(HUGO)

clean:
	rm -rf *.go public rsbio
