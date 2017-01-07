# How to use the Docker infrastructure

## Initialize

1. Create image with rails shell project:
 
    `./host_scripts/docker_build.sh`

1. Fetch the rails shell project contents:

    `./host_scripts/get_project.sh`    
    
## Work
    
### Run Tests
    
    `./host_scripts/docker_test.sh`
    
### Run a simple bash command in container
    
    `./host_scripts/docker_run.sh <arg>`