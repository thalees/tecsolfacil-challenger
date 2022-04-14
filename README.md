# Tecsolfacil Challenger <a align="right" href="https://ktlint.github.io/"><img align="right" src="https://img.shields.io/badge/elixir-%234B275F.svg?style=for-the-badge&logo=elixir&logoColor=white" alt="elixir"></a>

> Final challenge of an Address API with asynchronous CSV processing from Plug Campo + Solfácil Bootcamp 

<p align="center">
  <a href="#installation-and-requirements">Installation and Requirements</a> • 
  <a href="#how-to-run">How to run</a> •  
  <a href="#api-documentation">Api documentation</a> • 
  <a href="#license">License</a>
</p>

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development.

## Installation and Requirements

These instructions will get you a copy of the project up and running on your local machine for development. Before we install the application we need these systems and tools configured and installed:

- [Elixir >= 1.12 and OTP >= 24](https://elixir-lang.org/install.html)
- [Docker](https://docs.docker.com/get-docker/)

It is very easy to install and upload the application. Just follow the steps below and everything will be fine! 🎉
### Application

```
git clone https://github.com/thalees/tecsolfacil-challenger.git
cd tecsolfacil-challenger
```

Enable environment variables for local environment
```
source .env
```

Open your favorite Code Editing and build the project using `mix` commands:
```
mix deps.get && mix deps.compile
```

### Docker

To start the application, first we need to start the [Postgres](https://www.postgresql.org/) database via docker and run the migrations, for that execute the commands below:
```
docker-compose -f docker-compose-only-database.yml up -d
```

After the containers are working, create the database and run the migrations:
```
mix ecto.create && mix ecto.migrate
```

## How to run

After performing the initial setup, just run the application:
```
mix phx.server
```

Your application will be running on `localhost:4000`

### Run Application with docker 🐳

If you do not want to manually setup the application, you can run it via docker, just run the command:
```
docker-compose up -d
```


## Api documentation

This project has all its endpoints documented in **Postman** as a **shared collection**, to get a copy of its endpoints, 
just click the link below:

[![Run in Postman](https://run.pstmn.io/button.svg)](https://www.getpostman.com/collections/e2abd63a4d35dc0513c4)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
<p align="center"><b>Thanks and good tests 🎉</b></p>
<p align="center">
  <img width="100" height="100" alt="bye" src="https://media.giphy.com/media/JO3FKwP5Fwx44uMfDI/giphy.gif">
</p>