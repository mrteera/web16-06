from fabric.api import env, run
import os

def staging():
    env.host_string = os.environ['STAGING_HOSTNAME']
    env.user = os.environ['STAGING_USERNAME']
    env.use_ssh_config = True

def deploy():
    run("ls -l")
