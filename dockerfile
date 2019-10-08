ENV RUBY_MAJOR="2.4" \
  RUBY_VERSION="2.4.0" \
  RUBY_DOWNLOAD_SHA256="152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d" \
  RUBYGEMS_VERSION="2.7.2" \
  BUNDLER_VERSION="1.16.1" \
  GEM_HOME="/usr/local/bundle"

# Download and install Postgres
RUN set -ex \
  && sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
  && apt-get update -qq && apt-get install -y postgresql-9.4