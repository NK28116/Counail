-- +goose Up

-- These four tables do not carry user_id directly; ownership is reached by
-- traversing the foreign keys back to tasks.user_id. The policies use EXISTS
-- subqueries so the join is performed per-row by the planner. If this becomes
-- a hotspot we can materialize task ownership into each table later.

ALTER TABLE agent_configs     ENABLE ROW LEVEL SECURITY;
ALTER TABLE debate_sessions   ENABLE ROW LEVEL SECURITY;
ALTER TABLE debate_messages   ENABLE ROW LEVEL SECURITY;
ALTER TABLE consensus_results ENABLE ROW LEVEL SECURITY;

CREATE POLICY agent_configs_self_access ON agent_configs
    FOR ALL
    USING (EXISTS (
        SELECT 1 FROM tasks
        WHERE tasks.id = agent_configs.task_id
          AND tasks.user_id = auth.jwt() ->> 'sub'
    ))
    WITH CHECK (EXISTS (
        SELECT 1 FROM tasks
        WHERE tasks.id = agent_configs.task_id
          AND tasks.user_id = auth.jwt() ->> 'sub'
    ));

CREATE POLICY debate_sessions_self_access ON debate_sessions
    FOR ALL
    USING (EXISTS (
        SELECT 1 FROM tasks
        WHERE tasks.id = debate_sessions.task_id
          AND tasks.user_id = auth.jwt() ->> 'sub'
    ))
    WITH CHECK (EXISTS (
        SELECT 1 FROM tasks
        WHERE tasks.id = debate_sessions.task_id
          AND tasks.user_id = auth.jwt() ->> 'sub'
    ));

CREATE POLICY debate_messages_self_access ON debate_messages
    FOR ALL
    USING (EXISTS (
        SELECT 1 FROM debate_sessions ds
        JOIN tasks t ON t.id = ds.task_id
        WHERE ds.id = debate_messages.session_id
          AND t.user_id = auth.jwt() ->> 'sub'
    ))
    WITH CHECK (EXISTS (
        SELECT 1 FROM debate_sessions ds
        JOIN tasks t ON t.id = ds.task_id
        WHERE ds.id = debate_messages.session_id
          AND t.user_id = auth.jwt() ->> 'sub'
    ));

CREATE POLICY consensus_results_self_access ON consensus_results
    FOR ALL
    USING (EXISTS (
        SELECT 1 FROM debate_sessions ds
        JOIN tasks t ON t.id = ds.task_id
        WHERE ds.id = consensus_results.session_id
          AND t.user_id = auth.jwt() ->> 'sub'
    ))
    WITH CHECK (EXISTS (
        SELECT 1 FROM debate_sessions ds
        JOIN tasks t ON t.id = ds.task_id
        WHERE ds.id = consensus_results.session_id
          AND t.user_id = auth.jwt() ->> 'sub'
    ));

-- +goose Down

DROP POLICY IF EXISTS consensus_results_self_access ON consensus_results;
DROP POLICY IF EXISTS debate_messages_self_access   ON debate_messages;
DROP POLICY IF EXISTS debate_sessions_self_access   ON debate_sessions;
DROP POLICY IF EXISTS agent_configs_self_access     ON agent_configs;

ALTER TABLE consensus_results DISABLE ROW LEVEL SECURITY;
ALTER TABLE debate_messages   DISABLE ROW LEVEL SECURITY;
ALTER TABLE debate_sessions   DISABLE ROW LEVEL SECURITY;
ALTER TABLE agent_configs     DISABLE ROW LEVEL SECURITY;
