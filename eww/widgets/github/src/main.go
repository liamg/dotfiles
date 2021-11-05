package main

import (
	"context"
	"fmt"
	"net/http"
	"strings"
	"time"

	"github.com/google/go-github/v39/github"
)

// 10 rpm rate limit for unauthed search api
var toCheck = []string{
	"aquasecurity/tfsec",
	"aquasecurity/cfsec",
}

func main() {

	client := github.NewClient(http.DefaultClient)
	ctx, cancel := context.WithTimeout(context.Background(), time.Minute)
	defer cancel()

	fmt.Print("(box :orientation \"h\" :valign \"center\" :space-evenly false :spacing 1 ")
	for i, check := range toCheck {
		repo := strings.Split(check, "/")[1]
		result, _, err := client.Search.Repositories(ctx, check, nil)
		if err != nil || len(result.Repositories) == 0 {
			continue
		}
		if i > 0 {
			fmt.Print("(label :text \"  \")")
		}
		matchedRepo := result.Repositories[0]
		url := fmt.Sprintf("https://github.com/%s", check)
		fmt.Printf(`(button :onclick "xdg-open %s" (label :text "%s %d"))`, url, repo, *matchedRepo.StargazersCount)
	}
	fmt.Print(")")
}
