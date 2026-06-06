"use client";

import { useEffect, useState } from "react";

import { ping, type PingResponse } from "@/shared/api/client";

type Status =
  | { kind: "loading" }
  | { kind: "ok"; body: PingResponse }
  | { kind: "err"; reason: string };

export default function ApiCheckPage() {
  const [status, setStatus] = useState<Status>({ kind: "loading" });

  // Client-side fetch is intentional: this page's job is to exercise the
  // browser->Go CORS roundtrip (Phase 1-6 Gate Criteria). Server Components
  // bypass CORS and would defeat the test.
  useEffect(() => {
    const ctrl = new AbortController();
    ping(ctrl.signal)
      .then((body) => setStatus({ kind: "ok", body }))
      .catch((err: unknown) => {
        if (err instanceof DOMException && err.name === "AbortError") return;
        setStatus({
          kind: "err",
          reason: err instanceof Error ? err.message : String(err),
        });
      });
    return () => ctrl.abort();
  }, []);

  return (
    <main className="flex min-h-screen flex-col items-center justify-center gap-6 p-8">
      <h1 className="text-2xl font-semibold">Backend connectivity check</h1>

      {status.kind === "loading" && <p className="text-zinc-500">Pinging backend…</p>}

      {status.kind === "ok" && (
        <section className="rounded-lg border border-green-500/40 bg-green-500/10 p-4 text-green-700 dark:text-green-300">
          <p className="font-medium">Backend reachable</p>
          <dl className="mt-2 grid grid-cols-[auto_1fr] gap-x-3 text-sm">
            <dt className="text-zinc-500">service</dt>
            <dd className="font-mono">{status.body.service}</dd>
            <dt className="text-zinc-500">message</dt>
            <dd className="font-mono">{status.body.message}</dd>
          </dl>
        </section>
      )}

      {status.kind === "err" && (
        <section className="rounded-lg border border-red-500/40 bg-red-500/10 p-4 text-red-700 dark:text-red-300">
          <p className="font-medium">Backend unreachable</p>
          <p className="mt-1 font-mono text-sm">{status.reason}</p>
        </section>
      )}
    </main>
  );
}
