# spinnaker-local-docker-macos

Runs Spinnaker locally on macOS using docker.

## Prereqs

- Fork all spinnaker repos to your personal github
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
