FROM postgres:17.6-trixie

LABEL AUTHOR="Etearner <contact@elceka.com>"

# Install tzdata package
RUN apt-get update \
    && apt-get install -y --no-install-recommends tzdata \
    && rm -rf /var/lib/apt/lists/*

# Copy entrypoint file
COPY ./conf/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
