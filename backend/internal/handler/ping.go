package handler

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// PingResponse is the body returned by the Phase 1-6 connectivity-check
// endpoint. Kept as a named type (rather than gin.H) so the frontend has a
// stable contract to type against.
type PingResponse struct {
	Message string `json:"message"`
	Service string `json:"service"`
}

// Ping is the public liveness echo used by the frontend to verify cross-origin
// reachability. It is distinct from /healthz, which targets orchestrators and
// stays under the unversioned root.
func Ping(c *gin.Context) {
	c.JSON(http.StatusOK, PingResponse{
		Message: "pong",
		Service: "counail-backend",
	})
}
