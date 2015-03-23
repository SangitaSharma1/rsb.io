GOCC := go
ESC := esc
HUGO := hugo
PORT := 8080

.PHONY: all server static clean deploy

all: static server

deploy:
	boto-rsync --delete . s3://input.rsb.io/
	#boto-rsync --delete --dry-run --grant public-read public/ s3://rsb.io/

server: static main.go
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
