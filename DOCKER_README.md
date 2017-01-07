# How to use the Docker infrastructure

This describes how to use this repo's docker infrastructure to initialize a new Rails project and 
then proceed with development workflow.

## Initialize

1. Fork this repository to a new repo representing your Rails app.

1. Create image with rails shell project:
 
    `./host_scripts/docker_build.sh`

1. Fetch the rails shell project contents:

    `./host_scripts/get_project.sh`
        
1. Run tests
        
    `./host_scripts/docker_test.sh`
    
## Work
    
### Run Tests
    
    `./host_scripts/docker_test.sh`
    
### Run a simple bash command in container
    
    `./host_scripts/docker_run.sh <arg>`