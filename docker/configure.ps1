
# install & update
Add-Package 'docker-desktop' -displayName 'Docker'

# verify
docker --version | AddVersion -name 'Docker' -replacement 'docker version'
docker-compose --version | AddVersion -name 'Docker Compose' -replacement 'docker-compose version'
