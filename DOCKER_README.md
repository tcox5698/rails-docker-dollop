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
     
### Start Rails manually
    
1. Access bash command line on rails app instance

    `./host_scripts/docker_bash.sh`
    
1. Bundle install
    
    `bundle install` 

1. Start rails server and bind to ip correctly

    `rails s -b 0.0.0.0`
    
### Testing
    
rspec should just work
    
Cucumber has to be initialized in the context of rails
    
    `rails generate cucumber:install`
        
But the Dockerfile should have set up the PhantomJS headless browser simulator.        
    
### Manually Access the Web App
    
Find out your docker machine ip address. On Mac OSX use Docker Quickstart Terminal for this. 
You should see:

    docker is configured to use the default machine with IP 192.168.99.100
    
Point your browser at `http://<ip>:3000`

For example: http://192.168.99.100:3000