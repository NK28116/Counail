// Package redis exposes a thin constructor around go-redis so the rest of the
// backend can depend on a small, testable surface instead of pulling the
// upstream package directly. The eventual consumer is the Asynq worker
// queue (Phase 3) and any cache helpers.
package redis

import (
	"context"
	"fmt"

	goredis "github.com/redis/go-redis/v9"
)

// Client is re-exported so callers can write `redis.Client` everywhere and
// stay decoupled from the go-redis import path. Swap the alias if we ever
// replace the library.
type Client = goredis.Client

// Open parses a Redis URL (redis:// or rediss://), connects, and verifies the
// connection with a PING. The caller owns the returned client and must Close
// it.
func Open(ctx context.Context, url string) (*Client, error) {
	if url == "" {
		return nil, fmt.Errorf("redis: empty REDIS_URL")
	}
	opts, err := goredis.ParseURL(url)
	if err != nil {
		return nil, fmt.Errorf("redis: parse url: %w", err)
	}
	c := goredis.NewClient(opts)
	if err := c.Ping(ctx).Err(); err != nil {
		_ = c.Close()
		return nil, fmt.Errorf("redis: ping: %w", err)
	}
	return c, nil
}
