// Package config loads runtime settings from environment variables.
package config

import (
	"log/slog"
	"strings"

	"github.com/kelseyhightower/envconfig"
)

// Config holds the runtime settings for the backend server.
//
// Defaults are tuned for local development; production overrides the values
// through environment variables (see .env.example for the contract).
type Config struct {
	Port        string   `envconfig:"PORT" default:"8080"`
	LogLevel    string   `envconfig:"LOG_LEVEL" default:"info"`
	DatabaseURL string   `envconfig:"DATABASE_URL"`
	RedisURL    string   `envconfig:"REDIS_URL"`
	// AllowedOrigins enumerates Origin headers the API will accept from
	// browsers. Default is the Next.js dev server.
	AllowedOrigins []string `envconfig:"ALLOWED_ORIGINS" default:"http://localhost:3000"`
}

// Load reads environment variables into a Config.
func Load() (*Config, error) {
	var c Config
	if err := envconfig.Process("", &c); err != nil {
		return nil, err
	}
	return &c, nil
}

// SlogLevel maps the LogLevel string onto a slog.Level so the caller can build
// a handler without re-parsing the value.
func (c *Config) SlogLevel() slog.Level {
	switch strings.ToLower(c.LogLevel) {
	case "debug":
		return slog.LevelDebug
	case "warn":
		return slog.LevelWarn
	case "error":
		return slog.LevelError
	default:
		return slog.LevelInfo
	}
}
