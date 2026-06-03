-- +goose Up

-- Schema follows the Linear PRIDEV-226 spec (the more recently updated source
-- of truth for these tables; design.md predates the JSONB/session-keyed
-- consensus model and is being updated separately by Gemini).

CREATE TABLE agent_configs (
    id             UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id        UUID         NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
    role           VARCHAR(50)  NOT NULL,
    model          VARCHAR(100) NOT NULL,
    system_prompt  TEXT         NOT NULL,
    created_at     TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_agent_configs_task_id ON agent_configs(task_id);

CREATE TABLE debate_sessions (
    id                  UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    task_id             UUID         NOT NULL REFERENCES tasks(id) ON DELETE CASCADE,
    total_input_tokens  INT          NOT NULL DEFAULT 0,
    total_output_tokens INT          NOT NULL DEFAULT 0,
    total_cost          NUMERIC(10,4) NOT NULL DEFAULT 0,
    status              VARCHAR(50)  NOT NULL DEFAULT 'pending',
    created_at          TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_debate_sessions_task_id ON debate_sessions(task_id);
CREATE INDEX idx_debate_sessions_status  ON debate_sessions(status);

CREATE TABLE debate_messages (
    id              UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id      UUID         NOT NULL REFERENCES debate_sessions(id) ON DELETE CASCADE,
    agent_id        UUID         NOT NULL REFERENCES agent_configs(id) ON DELETE RESTRICT,
    role            VARCHAR(50)  NOT NULL,
    content         TEXT         NOT NULL,
    review_targets  JSONB,
    created_at      TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_debate_messages_session_id ON debate_messages(session_id);
CREATE INDEX idx_debate_messages_agent_id   ON debate_messages(agent_id);

CREATE TABLE consensus_results (
    id            UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    session_id    UUID         NOT NULL REFERENCES debate_sessions(id) ON DELETE CASCADE,
    consensus     JSONB        NOT NULL,
    disagreement  JSONB,
    unresolved    JSONB,
    created_at    TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    TIMESTAMPTZ  NOT NULL DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX idx_consensus_results_session_id ON consensus_results(session_id);

-- update_updated_at_column() is already created by 00001_initial_schema.sql.
-- debate_messages is treated as an append-only log so it has no updated_at trigger.

CREATE TRIGGER trg_agent_configs_updated_at
    BEFORE UPDATE ON agent_configs
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER trg_debate_sessions_updated_at
    BEFORE UPDATE ON debate_sessions
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER trg_consensus_results_updated_at
    BEFORE UPDATE ON consensus_results
    FOR EACH ROW EXECUTE FUNCTION update_updated_at_column();

-- +goose Down

DROP TABLE IF EXISTS consensus_results;
DROP TABLE IF EXISTS debate_messages;
DROP TABLE IF EXISTS debate_sessions;
DROP TABLE IF EXISTS agent_configs;
