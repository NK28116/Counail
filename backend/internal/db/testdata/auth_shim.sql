-- Local development shim for Supabase's `auth.jwt()` function.
--
-- Apply this against a plain postgres database BEFORE running the goose
-- migrations so the RLS policies referencing `auth.jwt()` can be created.
-- It returns an empty JSON object, so policies will reject all rows unless
-- `app.user_id` is set per-session (handled by the application later).

CREATE SCHEMA IF NOT EXISTS auth;

CREATE OR REPLACE FUNCTION auth.jwt() RETURNS jsonb
LANGUAGE sql
IMMUTABLE
AS $$
    SELECT COALESCE(
        NULLIF(current_setting('request.jwt', true), '')::jsonb,
        '{}'::jsonb
    );
$$;
