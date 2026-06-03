// Command server is the HTTP entry point for the Counail backend.
package main

import (
	"log/slog"
	"os"

	"github.com/gin-gonic/gin"

	"github.com/NK28116/Counail/backend/internal/config"
	"github.com/NK28116/Counail/backend/internal/handler"
)

func main() {
	cfg, err := config.Load()
	if err != nil {
		slog.Error("config load failed", "err", err)
		os.Exit(1)
	}

	logger := slog.New(slog.NewJSONHandler(os.Stdout, &slog.HandlerOptions{Level: cfg.SlogLevel()}))
	slog.SetDefault(logger)

	// ReleaseMode silences Gin's debug banner; switch to gin.DebugMode by
	// setting GIN_MODE=debug locally when extra route logging is needed.
	gin.SetMode(gin.ReleaseMode)
	r := gin.New()
	r.Use(gin.Recovery())
	handler.RegisterRoutes(r)

	addr := ":" + cfg.Port
	slog.Info("server starting", "addr", addr)
	if err := r.Run(addr); err != nil {
		slog.Error("server stopped", "err", err)
		os.Exit(1)
	}
}
