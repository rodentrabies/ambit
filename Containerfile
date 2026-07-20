FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    less \
    curl \
    cmake \
    pkg-config \
    ca-certificates \
    python3 \
    python3-pip \
    python3-venv \
    python-is-python3 \
    && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://claude.ai/install.sh | bash

ENV PATH="/root/.local/bin:${PATH}"

ENV DISABLE_AUTOUPDATER=1

WORKDIR /workspace

CMD ["claude"]
