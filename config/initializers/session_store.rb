# frozen_string_literal: true

Insta::Application.config.session_store :redis_store,
                                        servers: ['redis://localhost:6379/0/session'],
                                        expire_after: 1.days