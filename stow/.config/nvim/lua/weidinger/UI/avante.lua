require("avante").setup({
    selection = {
        enabled = false,
    },
    -- rag_service = { -- RAG Service configuration
    --     enabled = true, -- Enables the RAG service
    --     host_mount = os.getenv("HOME") .. "/Projects", -- Host mount path for the rag service (Docker will mount this path)
    --     runner = "docker", -- Runner for the RAG service (can use docker or nix)
    --     llm = { -- Language Model (LLM) configuration for RAG service
    --         provider = "openai", -- LLM provider
    --         endpoint = "https://api.openai.com/v1", -- LLM API endpoint
    --         api_key = "OPENAI_API_KEY", -- Environment variable name for the LLM API key
    --         model = "gpt-4o-mini", -- LLM model name
    --         extra = nil, -- Additional configuration options for LLM
    --     },
    --     embed = { -- Embedding model configuration for RAG service
    --         provider = "openai", -- Embedding provider
    --         endpoint = "https://api.openai.com/v1", -- Embedding API endpoint
    --         api_key = "OPENAI_API_KEY", -- Environment variable name for the embedding API key
    --         model = "text-embedding-3-large", -- Embedding model name
    --         extra = nil, -- Additional configuration options for the embedding model
    --     },
    --     docker_extra_args = "", -- Extra arguments to pass to the docker command
    -- },
})
