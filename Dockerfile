# Dockerfile
FROM elixir:latest

# Create app directory and copy the Elixir project into it
WORKDIR /app
COPY mix.exs .
COPY lib lib
# Install hex package manager and rebar
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix compile

RUN echo "#!/bin/bash\niex -S mix" > run.sh && \
    chmod +x run.sh

CMD ["./run.sh"]
