# README
**Prerequisites for development**
- Docker
  - Ubuntu: https://docs.docker.com/engine/installation/linux/ubuntulinux/
  - OS X: https://docs.docker.com/docker-for-mac/
- Git

**Development Environment**
```
git clone git@vgl-ait.org:web16-06
cd web16-06
git config user.name <your_name>
git config user.email <your_email>
git remote add both git@vgl-ait.org:web16-06
git remote set-url --add --push both git@vgl-ait.org:web16-06
git remote set-url --add --push both git@github.com:mrteera/web16-06.git
```
```
docker-compose build
docker-compose up
# Now you should be able to access http://localhost:3000
```

**How to run the test suite**
- Unit tests
```
# Open a new terminal
docker-compose run web zeus start
# Open another new terminal
docker-compose run web bundle exec guard --force-polling
# Open another new terminal
docker-compose run web zeus cucumber
```

**Deployment instructions**

**Credits:**
- Docker configurations: https://github.com/prontotools/pronto-woo-notifier
