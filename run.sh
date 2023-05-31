#! /bin/bash

set -eo pipefail

sed 's?https://0.0.0.0:16443?https://host.docker.internal:16443?g' ~/.kube/config_ > ~/.kube/config

hal config deploy edit --type localgit --git-origin-user=thameezb
hal config version edit --version branch:upstream/master

echo "host: 0.0.0.0" | tee \
    ~/.hal/default/service-settings/gate.yml \
    ~/.hal/default/service-settings/deck.yml

echo "overrideBaseUrl: redis://redis:6379" | tee \
    ~/.hal/default/service-settings/redis.yml

echo "spinnaker.s3.versioning: false" | tee \
    ~/.hal/default/profiles/front50-local.yml
hal config storage s3 edit --endpoint http://minio:9000 \
    --access-key-id minioadmin \
    --secret-access-key minioadmin \
    --path-style-access true
hal config storage edit --type s3

hal config provider kubernetes enable
hal config provider kubernetes account add kind \
    --context kind-kind

hal deploy apply