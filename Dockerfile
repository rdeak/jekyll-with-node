FROM ruby:3.1-slim-bookworm as base

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential git curl && \
    rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash && \
    apt-get install -y --no-install-recommends nodejs

RUN gem update --system && \
    gem install bundler webrick jekyll jekyll-postcss &&  \
    gem cleanup

EXPOSE 4000
EXPOSE 35729

WORKDIR /site

ENTRYPOINT [ "jekyll" ]

CMD [ "--help" ]

FROM base as serve

ADD docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "--livereload", "-o"]