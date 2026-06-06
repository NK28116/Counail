# syntax=docker/dockerfile:1.7

# ---------- builder ----------
# Pinned Go toolchain matches go.mod and the GitHub Actions CI matrix so
# locally-built and CI-built binaries stay byte-identical.
FROM golang:1.25.7-alpine AS builder

WORKDIR /src

# Resolve module graph in its own layer so source-only edits do not invalidate
# the (slow) `go mod download` step on subsequent rebuilds.
COPY go.mod go.sum ./
RUN go mod download

COPY . .

# CGO_ENABLED=0 produces a fully static binary compatible with the distroless
# static runtime. -trimpath strips build host paths for reproducibility,
# -s -w drops the symbol table to shrink the final image by a few MB.
ARG TARGETOS=linux
ARG TARGETARCH=amd64
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} \
    go build -trimpath -ldflags="-s -w" -o /out/server ./cmd/server

# ---------- runtime ----------
# distroless/static-debian12:nonroot ships only ca-certificates, tzdata, and
# /etc/passwd with a 65532 nonroot user — no shell, no package manager, no
# writable layers beyond the binary. Minimal attack surface for Cloud Run et al.
FROM gcr.io/distroless/static-debian12:nonroot

WORKDIR /app

COPY --from=builder /out/server /app/server

# Drops privileges by uid:gid pair so the container never runs as root even if
# the orchestrator forgets to set runAsNonRoot.
USER nonroot:nonroot

# Cloud Run injects PORT at runtime; 8080 is the documented default the server
# falls back to via config.Load(). EXPOSE is documentation, not enforcement.
EXPOSE 8080

ENTRYPOINT ["/app/server"]
