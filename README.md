# Taktik Tasks

> This project is under development, files and templates can change without compatibility.

Taktik Tasks is template of [Taskfile](https://taskfile.dev) with predefined tasks and scripts to provision docker container for local docker-compose based development, mostly for php symfony applications.

## Motivation

My primary development environment were vagrant based VirtualBox VM. It still nice, provide food shell experience and isolation, hovewer, VirtualBox is not compatible with Apple M1 chip. I tried many tools: self-made shell scripts, node with google zx library, Lando and others. Shell scripts quickly become a unmaintainable. Node scripts require installing dependencies if. The most successful is Lando. Hoverer, the number of custom kludges I had to put for Lando become too quickly too big. In addition, мery poor performance on mounted volumes mac os and the impossibility / high complexity of the configuration forced to look for other tools. From Lando I like an Idea of yaml config and tooling feature.

## Quick start

Install Taskfile

Requirements:

* docker
* docker-compose
* Taskfile

```shell
brew install go-task/tap/go-task
```

To improve MacOS volumen performance, install [Mutagen Compose](https://mutagen.io/documentation/orchestration/compose), replace override `COMPOSE_BINARY` and add `docker-compose.macosx.yaml` to `COMPOSE_OPTIONS` in `.taktik` dotenv file.

Optionally, create an alias to `task` binary as a `taktik` for shell

`~/.zshrc` or `~/.bashrc`

```zsh
alias taktik=task
```

## Tasks

Some main tasks of `docker-compose` tasks are defined. Taskfile template should be edited according to project needs and more tasks can be added.

Small subset of . Tasks options can be extended with environment variables. All commands can be configured with environment variables, in addition, CLI arguments can be forwarded. Usage `task up -- -d`

## Scripts

Most of scripts are borrowed from [VS Code Remote script library](https://github.com/microsoft/vscode-dev-containers/tree/main/script-library).

## PHP configs

These are development configs to use with PHP and PHP-FPM.

## Variables

Tasks commands are configurable with environment variables.
Options for each task can be defined in dotenv file in format `X_OPTIONS` where `X` uppercase task name, example: `UP_OPTIONS=-d`

**COMPOSE_BINARY** default is `docker-compose`. Change it if you are using [Mutagen Compose](https://mutagen.io/documentation/orchestration/compose)

**COMPOSE_OPTIONS** global docker-compose options, like filenames or env variables. Example: `COMPOSE_OPTIONS=--env-file=/dev/null -f custom-compose.yaml`

### Dotenv files

All variables can be overridden in dotenv files. Define environment variables in `.taktik` and dut do not commit into the project. use `.taktik.dist` to provide env var examples of recommendations.
