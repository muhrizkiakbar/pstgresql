FROM starefossen/ruby-node:2-8-stretch

# Install the software you need
RUN apt-get update \
&& apt-get install -y \
apt-utils \
build-essential \
libpq-dev \
libjpeg-dev \
libpng-dev \
nodejs \
yarn \
telnetd \
&& gem install bundler

# Create a directory for your app
# RUN mkdir -p /app

# Copy the files needed for the bundle install
COPY ./Gemfile /billingsystem/Gemfile
COPY ./Gemfile.lock /billingsystem/Gemfile.lock

# Set the working directory for all following commands
WORKDIR /billingsystem

RUN bundle install

ENV DEFAULT_URL http://localhost:3000
RUN echo 'alias hi="echo hello"' >> ~/.bashrc

