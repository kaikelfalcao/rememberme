package main

import (
	"flag"
	"fmt"
	"os"
	"os/exec"
	"time"
)

func main() {

	var message = flag.String("message", "Reminder", "Message to display after the delay")
	var delay = flag.Duration("delay", 10*time.Second, "Delay before displaying the message (e.g., 10s, 1m, 1h)")
	flag.Parse()

	if *delay <= 0 {
		fmt.Println("Error: delay must be a positive integer")
		os.Exit(1)
	}

	if os.Getenv("BACKGROUND") != "1" {
		cmd := exec.Command(os.Args[0], "--message", *message, "--delay", delay.String())
		cmd.Env = append(os.Environ(), "BACKGROUND=1")
		err := cmd.Start()
		if err != nil {
			fmt.Println("Error starting background process:", err)
			os.Exit(1)
		}
		fmt.Println("Background job started. Exiting main process.")
		os.Exit(0)
	}

	time.Sleep(*delay)

	err := exec.Command("notify-send", "Reminder", *message).Run()
	if err != nil {
		fmt.Println("Error sending notification:", err)
		os.Exit(1)
	}

	os.Exit(0)
}
