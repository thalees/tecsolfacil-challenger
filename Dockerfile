FROM elixir:latest

RUN apt-get update && \
  apt-get install -y postgresql-client

EXPOSE 4000:4000

RUN mkdir /app
COPY . /app
WORKDIR /app

RUN mix local.hex --force

RUN mix do compile

CMD ["./docker/entrypoint.sh"]

