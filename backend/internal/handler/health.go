// Package handler provides HTTP route handlers for the backend server.
package handler

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// RegisterRoutes wires every route the server exposes onto the given engine.
//
// Routes are registered here so cmd/server/main.go stays free of routing
// details and the package becomes the single source of truth for the public
// HTTP surface.
func RegisterRoutes(r *gin.Engine) {
	r.GET("/healthz", Health)

	v1 := r.Group("/api/v1")
	v1.GET("/ping", Ping)
}

// Health responds with the server's liveness status.
//
// The body is intentionally minimal so the endpoint stays cheap enough to be
// hit by container orchestrators (Cloud Run, k8s) on a tight interval.
func Health(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"status": "ok"})
}
