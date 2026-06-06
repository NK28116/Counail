package redis

import (
	"context"
	"testing"

	"github.com/alicebob/miniredis/v2"
)

func TestOpen_PingsRunningServer(t *testing.T) {
	s := miniredis.RunT(t)
	url := "redis://" + s.Addr()

	c, err := Open(context.Background(), url)
	if err != nil {
		t.Fatalf("Open: %v", err)
	}
	defer c.Close()

	if got, err := c.Ping(context.Background()).Result(); err != nil || got != "PONG" {
		t.Fatalf("Ping after Open: got %q, err %v; want %q, nil", got, err, "PONG")
	}
}

func TestOpen_EmptyURL(t *testing.T) {
	_, err := Open(context.Background(), "")
	if err == nil {
		t.Fatal("expected error for empty url")
	}
}

func TestOpen_MalformedURL(t *testing.T) {
	_, err := Open(context.Background(), "not://a-valid-redis-url")
	if err == nil {
		t.Fatal("expected error for malformed url")
	}
}

func TestOpen_UnreachableServer(t *testing.T) {
	// Port 1 is privileged and unbound on macOS/Linux; the dial fails fast
	// and we should propagate the ping error to the caller.
	_, err := Open(context.Background(), "redis://127.0.0.1:1")
	if err == nil {
		t.Fatal("expected error for unreachable server")
	}
}
