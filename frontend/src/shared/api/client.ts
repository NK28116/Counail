// Typed entry point for talking to the Go backend.
//
// The base URL is read from NEXT_PUBLIC_API_BASE_URL at build time so the
// same bundle can target localhost during dev and a real host in
// production. Falls back to the dev-server default so a fresh clone "just
// works" without touching .env.local.

const API_BASE_URL = process.env.NEXT_PUBLIC_API_BASE_URL ?? "http://localhost:8080";

export type PingResponse = {
  message: string;
  service: string;
};

export async function ping(signal?: AbortSignal): Promise<PingResponse> {
  const res = await fetch(`${API_BASE_URL}/api/v1/ping`, { signal });
  if (!res.ok) {
    throw new Error(`backend responded ${res.status}`);
  }
  return (await res.json()) as PingResponse;
}
