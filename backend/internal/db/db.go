// Package db owns the postgres connection pool and exposes the goose-driven
// migration runner. Migration SQL files live under migrations/ and are
// compiled into the binary via go:embed so the migrate command can ship as a
// single artifact (see the goose ADR on PRIDEV-229).
package db

import (
	"context"
	"database/sql"
	"embed"
	"fmt"

	_ "github.com/jackc/pgx/v5/stdlib" // database/sql driver registration
	"github.com/pressly/goose/v3"
)

//go:embed migrations/*.sql
var migrationsFS embed.FS

const (
	migrationsDir = "migrations"
	dialect       = "postgres"
)

// MigrationsFS exposes the embedded migration files so callers (tests, custom
// runners) can inspect or re-mount them without re-implementing the embed.
func MigrationsFS() embed.FS { return migrationsFS }

// Open dials the given postgres URL and verifies the connection with a ping.
// The caller is responsible for closing the returned *sql.DB.
func Open(ctx context.Context, url string) (*sql.DB, error) {
	if url == "" {
		return nil, fmt.Errorf("db: empty DATABASE_URL")
	}
	conn, err := sql.Open("pgx", url)
	if err != nil {
		return nil, fmt.Errorf("db: open: %w", err)
	}
	if err := conn.PingContext(ctx); err != nil {
		_ = conn.Close()
		return nil, fmt.Errorf("db: ping: %w", err)
	}
	return conn, nil
}

// RunGoose dispatches a goose command (`up`, `down`, `status`, `version`,
// `redo`, `reset`, `up-to`, `down-to`) against the given *sql.DB using the
// embedded migration files.
func RunGoose(conn *sql.DB, command string, args ...string) error {
	goose.SetBaseFS(migrationsFS)
	if err := goose.SetDialect(dialect); err != nil {
		return fmt.Errorf("db: set dialect: %w", err)
	}
	return goose.Run(command, conn, migrationsDir, args...)
}
