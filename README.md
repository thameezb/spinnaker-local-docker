# spinnaker-local-docker-macos

A very opinionated and rudimentary manner to run Spinnaker locally on macOS using docker (shout out to @mazzy89 for the guidance).

## Prereqs

- Fork all required spinnaker repos to your personal github
  - https://github.com/spinnaker/clouddriver
  - https://github.com/spinnaker/deck
  - https://github.com/spinnaker/echo
  - https://github.com/spinnaker/fiat
  - https://github.com/spinnaker/front50
  - https://github.com/spinnaker/gate
  - https://github.com/spinnaker/igor
  - https://github.com/spinnaker/kayenta
  - https://github.com/spinnaker/orca
  - https://github.com/spinnaker/rosco
- Install Docker Desktop, kubectl, and kind locally
- Create `~/projects/spinnaker` directory
- Create `~/projects/spinnaker/minio` directory
- Create kind cluster
  - `kind create cluster --config kind.yml`

## Run

- Start containers
  - `docker-compose up --build`
- Exec onto halyard container and start spinnaker
  - `docker exec -it halyard bash`
  - `./run.sh`
