import path from "node:path";
import type { NextConfig } from "next";

const nextConfig: NextConfig = {
  // Anchor workspace root to this directory to suppress the multi-lockfile detection warning.
  turbopack: {
    root: path.resolve(__dirname),
  },
};

export default nextConfig;
