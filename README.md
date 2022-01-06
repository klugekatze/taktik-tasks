# Taktik Tasks

Taktik task is a [Taskfile](https://taskfile.dev) with predefined tasks.
Can be used as a template file per project for docker based development routine automation

## Tasks

Small subset of `docker-compose` tasks is defined. Tasks options can be extended with environment variables. All commands can be configured with environment variables, in addition, CLI arguments can be forwarded. Usage `task up -- -d`

## Variables

Tasks commands are configurable with environment variables.
Options for each task can be defined in dotenv file in format `X_OPTIONS` where `X` uppercase task name, example: `UP_OPTIONS=-d`

**COMPOSE_BINARY** default is `docker-compose`. Change it if you are using [Mutagen Compose](https://mutagen.io/documentation/orchestration/compose)

**COMPOSE_OPTIONS** global docker-compose options, like filenames or env variables. Example: COMPOSE_OPTIONS=--env-file=/dev/null -f custom-compose.yaml

### Dotenv files

All variables can be overridden in dotenv files. Define environment variables in `.taktik` and commit into the project
Use `.taktik.local` file to override variables locally from dist `.taktik` file, add this file into project `.gitignore`.
