from fabric.api import env, run, cd
import os

def staging():
    env.host_string = os.environ['STAGING_HOSTNAME']
    env.user = os.environ['STAGING_USERNAME']
    env.use_ssh_config = True

def deploy():
    with cd('/home/web6/web16-06-docker'):
        run("docker-compose -f PS/ps1/docker-compose.production.yml up -d")
