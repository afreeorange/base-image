# For logging into Docker and figuring out the tag to push as
DEFAULT_USERNAME="afreeorange"

if [[ -z "$DOCKER_PASSWORD" ]]; then
    echo "❗️ You didn't set the DOCKER_PASSWORD env var!"
    exit 1
fi

if [[ -z "$DOCKER_USERNAME" ]]; then
    DOCKER_USERNAME="$DEFAULT_USERNAME"
fi

VERSION=$(cat VERSION)

# We should be ready!
echo "Attempting to publish v$VERSION to DockerHub as $DOCKER_USERNAME ..."

# Log in
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag the image
docker build --tag afreeorange/build:latest .
docker build --tag afreeorange/build:"$VERSION" .

# Push to DockerHub!
docker push afreeorange/build:latest
docker push afreeorange/build:"$VERSION"