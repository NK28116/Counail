package db

import (
	"io/fs"
	"strings"
	"testing"
)

func TestMigrationsFS_HasExpectedFiles(t *testing.T) {
	entries, err := fs.ReadDir(MigrationsFS(), migrationsDir)
	if err != nil {
		t.Fatalf("read embedded migrations dir: %v", err)
	}
	if got, want := len(entries), 4; got != want {
		t.Fatalf("migration file count: got %d, want %d", got, want)
	}

	want := []string{
		"00001_initial_schema.sql",
		"00002_enable_rls.sql",
		"00003_debate_schema.sql",
		"00004_debate_rls.sql",
	}
	for i, e := range entries {
		if e.Name() != want[i] {
			t.Errorf("migration[%d]: got %q, want %q", i, e.Name(), want[i])
		}
	}
}

func TestMigrationsFS_EachFileHasGooseDirectives(t *testing.T) {
	entries, err := fs.ReadDir(MigrationsFS(), migrationsDir)
	if err != nil {
		t.Fatalf("read embedded migrations dir: %v", err)
	}
	for _, e := range entries {
		body, err := fs.ReadFile(MigrationsFS(), migrationsDir+"/"+e.Name())
		if err != nil {
			t.Fatalf("read %s: %v", e.Name(), err)
		}
		s := string(body)
		if !strings.Contains(s, "-- +goose Up") {
			t.Errorf("%s: missing `-- +goose Up`", e.Name())
		}
		if !strings.Contains(s, "-- +goose Down") {
			t.Errorf("%s: missing `-- +goose Down`", e.Name())
		}
	}
}
