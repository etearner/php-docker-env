FROM nginx:1.29-bookworm

LABEL AUTHOR="Etearner <contact@elceka.com>"

# Install tzdata so system honors TZ
RUN apt-get update \
    && apt-get install -y --no-install-recommends tzdata bash \
    && rm -rf /var/lib/apt/lists/*
