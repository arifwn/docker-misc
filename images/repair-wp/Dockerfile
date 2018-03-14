FROM wordpress:cli

RUN apk add --no-cache \
		bash \
		vim \
		curl \
		zip

COPY repair-wp.sh /usr/local/bin/
