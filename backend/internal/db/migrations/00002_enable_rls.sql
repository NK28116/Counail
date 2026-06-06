-- +goose Up

-- Row Level Security ensures a row is only visible to the user whose external
-- auth ID (Clerk `sub` claim) matches the row's user_id / id column.
--
-- `auth.jwt()` is provided by Supabase out of the box. For local postgres
-- testing without Supabase, install the shim in
-- backend/internal/db/testdata/auth_shim.sql before applying these migrations.

ALTER TABLE users    ENABLE ROW LEVEL SECURITY;
ALTER TABLE api_keys ENABLE ROW LEVEL SECURITY;
ALTER TABLE tasks    ENABLE ROW LEVEL SECURITY;

CREATE POLICY users_self_access ON users
    FOR ALL
    USING      (id = auth.jwt() ->> 'sub')
    WITH CHECK (id = auth.jwt() ->> 'sub');

CREATE POLICY api_keys_self_access ON api_keys
    FOR ALL
    USING      (user_id = auth.jwt() ->> 'sub')
    WITH CHECK (user_id = auth.jwt() ->> 'sub');

CREATE POLICY tasks_self_access ON tasks
    FOR ALL
    USING      (user_id = auth.jwt() ->> 'sub')
    WITH CHECK (user_id = auth.jwt() ->> 'sub');

-- +goose Down

DROP POLICY IF EXISTS tasks_self_access    ON tasks;
DROP POLICY IF EXISTS api_keys_self_access ON api_keys;
DROP POLICY IF EXISTS users_self_access    ON users;

ALTER TABLE tasks    DISABLE ROW LEVEL SECURITY;
ALTER TABLE api_keys DISABLE ROW LEVEL SECURITY;
ALTER TABLE users    DISABLE ROW LEVEL SECURITY;
