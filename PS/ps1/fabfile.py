from fabric.api import env, run
import os

def staging():
    env.host_string = os.environ['PRODUCTION_IP']
    env.user = os.environ['STAGING_USERNAME']

def deploy():
    run("ls -l")
