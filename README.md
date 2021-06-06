# My Base Image ⛺️

Ubuntu-based image I use to work on and build my stuff. 

## Building and Deploying

**Versioning is done via `git` tags**. Used to have a `VERSION` file but... why? [This comment](https://gist.github.com/rponte/fdc0724dd984088606b0#gistcomment-3064455) on a gist is how I extract the version when manually building and deploying. DockerHub itself relies on git tags.

```bash
# Build
.scripts/local-build

# View and bump tags
git tag a.b.c

# Deploy. Set vars first.
DOCKERHUB_USERNAME="afreeorange" DOCKERHUB_PASSWORD="SECRET" .scripts/local-deploy

# Push changes to remote
git push && git push --tags
```
So don't forget to `git push origin master --tags` 🤗 

## Miscellaneous Notes

### FROM:Latest

[A Dockerfile linter](http://fromlatest.io/) of sorts.

### Alpine Image Setup (Incomplete; no `advpng` to optimize images)

Was about 30% smaller than the Ubuntu image. Get things done before thinking about these things 💖

### DockerHub Tagging

Under "Build Configurations"

| Source Type |               Source               |    Docker Tag    |
|-------------|------------------------------------|------------------|
| Branch      | master                             | latest           |
| Tag         | `/^([0-9]+)\.([0-9]+)\.([0-9]+)$/` | `{\1}.{\2}`      |
| Tag         | `/^([0-9]+)\.([0-9]+)\.([0-9]+)$/` | `{\1}.{\2}.{\3}` |
