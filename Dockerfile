FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir /prompts-searcher
WORKDIR /prompts-searcher

COPY Gemfile /prompts-searcher/Gemfile
COPY Gemfile.lock /prompts-searcher/Gemfile.lock

COPY arrow.sh /prompts-searcher/arrow.sh
RUN chmod +x /prompts-searcher/arrow.sh
RUN /prompts-searcher/arrow.sh

RUN bundle install

COPY . /prompts-searcher
RUN chmod +x /prompts-searcher/deployment-tasks.sh

EXPOSE 3000
ARG RAILS_ENV=production
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
