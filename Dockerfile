FROM ruby:2.5
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /usr/src/app

COPY . .
RUN bundle install
RUN bundle exec spring binstub --all

EXPOSE 80

CMD ["bin/rails", "server", "-p", "80", "-b", "0.0.0.0"]
