// Command migrate drives goose migrations against the configured database.
//
// Usage:
//
//	migrate <command> [args...]
//
// Common commands: up, down, status, version, up-to <version>, down-to <version>.
//
// Reads DATABASE_URL from the environment (or .env-style variables resolved
// via internal/config).
package main

import (
	"context"
	"errors"
	"fmt"
	"log/slog"
	"os"

	"github.com/NK28116/Counail/backend/internal/config"
	"github.com/NK28116/Counail/backend/internal/db"
)

func main() {
	if err := run(context.Background(), os.Args[1:]); err != nil {
		slog.Error("migrate failed", "err", err)
		os.Exit(1)
	}
}

func run(ctx context.Context, args []string) error {
	if len(args) == 0 {
		return errors.New("usage: migrate <up|down|status|version|up-to|down-to> [args...]")
	}
	command, extra := args[0], args[1:]

	cfg, err := config.Load()
	if err != nil {
		return fmt.Errorf("config: %w", err)
	}
	if cfg.DatabaseURL == "" {
		return errors.New("DATABASE_URL is required")
	}

	conn, err := db.Open(ctx, cfg.DatabaseURL)
	if err != nil {
		return err
	}
	defer func() { _ = conn.Close() }()

	return db.RunGoose(conn, command, extra...)
}
