// Typed entry point for talking to the Go backend.
//
// The base URL is read from NEXT_PUBLIC_API_BASE_URL at build time so the
// same bundle can target localhost during dev and a real host in
// production. Falls back to the dev-server default so a fresh clone "just
// works" without touching .env.local.

// `??` would accept an empty string and silently route requests to the Next.js
// origin instead of the Go backend, so treat blank values as unset before
// picking the fallback. Trailing slashes are stripped to keep path joining
// safe against e.g. "http://host/" producing "//api/v1/ping".
const envUrl = process.env.NEXT_PUBLIC_API_BASE_URL?.trim() || "";
const rawBaseUrl = envUrl === "" ? "http://localhost:8080" : envUrl;
const API_BASE_URL = rawBaseUrl.replace(/\/+$/, "");

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
