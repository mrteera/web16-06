from fabric.api import env, run
import os

def staging():
    env.host_string = os.environ['STAGING_HOSTNAME']
    env.user = os.environ['STAGING_USERNAME']

def deploy():
    run("ls -l")
