package main

import (
	"fmt"
	"os"
	"strconv"
	"strings"

	"go.i3wm.org/i3/v4"
)

func main() {

	if len(os.Args) <= 1 {
		panic("please supply output number")
	}

	primary := os.Args[1] == "primary"

	updateWorkspaces(primary)

	subscription := i3.Subscribe(i3.WorkspaceEventType)
	for subscription.Next() {
		event := subscription.Event()
		switch event.(type) {
		case *i3.WorkspaceEvent:
			updateWorkspaces(primary)
		}
	}
}

func updateWorkspaces(primary bool) {
	workspaces, err := i3.GetWorkspaces()
	if err != nil {
		fmt.Printf("Error: %s\n", err)
		return
	}

	var outputName string
	outputs, err := i3.GetOutputs()
	if err != nil {
		fmt.Printf("Error: %s\n", err)
		return
	}
	for _, output := range outputs {
		if output.Primary == primary {
			outputName = output.Name
		}
	}

	// open box
	fmt.Printf("(box ")
	for _, workspace := range workspaces {

		if workspace.Output != outputName {
			continue
		}

		var class string
		if workspace.Urgent {
			class = "urgent"
		} else if workspace.Focused {
			class = "focused"
		}

		fmt.Printf(
			`(button `+
				`:onclick "i3-msg workspace '%s'"`+
				`:class '%s'`+
				`(label :text '%s'))`,
			workspace.Name,
			class,
			strings.TrimPrefix(workspace.Name, strconv.Itoa(int(workspace.Num))),
		)
	}

	// close box + newline for send
	fmt.Println(")")
}
