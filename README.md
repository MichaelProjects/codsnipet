## Codesnipt
An application to store and index your code snippets. 

![Frontend-screenshot](/img/img1.png)


## Install
I recommend using the [docker container]("https://hub.docker.com/r/michaellichtenecker/codesnipt") that is available on the "docker hub". 
Before we start the docker container we need to define the "conf.toml" file.

run following command to get a sample config.

```bash
wget https://raw.githubusercontent.com/MichaelProjects/codsnipet/master/backend/docker_conf.toml && mv docker_conf.toml conf.toml
```
Replace the mongodb connection string and you are ready to go.

Now we can start the docker container.

```bash
docker pull michaellichtenecker/codesnipt:latest
docker run -d -p 0.0.0.0:29000:29000 -v ${PWD}/conf.toml:/conf.toml michaellichtenecker/codesnipt:latest
```

## Get started
After you followed the install instructions above, you are ready to configure the frontend.

So that the frontend is able to communicate with the backend, we need to specify the URL of the backend eg: https://example.com. 

Open the installed frontend and click on the settings tab.

![Frontend-screenshot](/img/img2.png)
Enter your correct backend URL in the host field and click on the update button.

Finally, you can start using the application.

## Web Version
If the current release contains a web version, you are able to deploy the build as a regular static website. Normally you could use nginx, but dont forget to handle CORS.

## Platforms
Currently i only provide a frontend version for macos, but i will soon add a frontend for windows and linux.


## Techstack
- Rust(Rocket)
- Dart(Flutter)
- MongoDB

