FROM ruby:3.1
RUN apt-get update && apt-get install --no-install-recommends -y \
ca-certificates \
build-essential \
nodejs \
yarn \
unzip \
imagemagick \
software-properties-common \
git \
libpq-dev \
openssl \
--fix-missing \
&& rm -rf /var/lib/apt/lists/*

WORKDIR /alexvirtualbrApp
COPY Gemfile /alexvirtualbrApp/Gemfile
COPY Gemfile.lock /alexvirtualbrApp/Gemfile.lock
RUN bundle install 
COPY . /alexvirtualbrApp
COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD [ "bash" ]
#CMD ["rails", "s", "-b, "0.0.0.0"]