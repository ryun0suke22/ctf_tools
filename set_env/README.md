# build
touch .env
docker-compose build

# gen container
docker-compose run kali-linux

# gen container (for xserver with xquartz)
bash run.sh

