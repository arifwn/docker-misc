FROM wordpress:php7.2

# install the PHP extensions we need
RUN set -ex; \
	\
	savedAptMark="$(apt-mark showmanual)"; \
	\
	apt-get update; \
	apt-get install -y --no-install-recommends \
		libmemcached-dev \
		libz-dev \
		libxml2-dev \
		libxslt-dev \
		unixodbc-dev \
	; \
	\
	pecl install memcached; \
	docker-php-ext-enable memcached; \
	docker-php-ext-configure pdo_odbc --with-pdo-odbc=unixODBC,/usr; \
	docker-php-ext-install xsl pdo_odbc soap; \
	\
# reset apt-mark's "manual" list so that "purge --auto-remove" will remove all build dependencies
	apt-mark auto '.*' > /dev/null; \
	apt-mark manual $savedAptMark; \
	ldd "$(php -r 'echo ini_get("extension_dir");')"/*.so \
		| awk '/=>/ { print $3 }' \
		| sort -u \
		| xargs -r dpkg-query -S \
		| cut -d: -f1 \
		| sort -u \
		| xargs -rt apt-mark manual; \
	\
	apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false; \
	apt-get install -y \
		zip \
		unzip \
		unixodbc \
	; \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apache2-foreground"]
