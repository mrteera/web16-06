from fabric.api import env, run, cd
import os

def staging():
    env.host_string = os.environ['STAGING_HOSTNAME']
    env.user = os.environ['STAGING_USERNAME']
    env.use_ssh_config = True

def deploy():
    with cd('/home/web6/web16-06-docker'):
        run("docker pull {}:{}".format(os.environ['REPO'], os.environ['COMMIT']))
        run("docker-compose -f mejelly/docker-compose.production.yml run web rails db:migrate")
        run("docker-compose -f mejelly/docker-compose.production.yml run web rails assets:precompile")
        run("docker-compose -f mejelly/docker-compose.production.yml run web service nginx reload")
