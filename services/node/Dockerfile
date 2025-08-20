FROM node:24.6-alpine

LABEL AUTHOR="Etearner <contact@elceka.com>"

# Install system dependencies
RUN apk add --no-cache tzdata git make

# Enable pnpm via corepack (ships with Node >=16.13)
RUN corepack enable pnpm

# Set working directory
WORKDIR /var/www/app

# Mark repo as safe (useful for containers mounting host volumes)
RUN git config --global --add safe.directory /var/www/app

CMD ["tail", "-f", "/dev/null"]
