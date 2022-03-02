## Codesnipt
An application to store and index your code snippets.

## Install
I recommend using the [docker container]("https://hub.docker.com/r/michaellichtenecker/codesnipt") i provided. 
Before we starting the docker container we need to define the "conf.toml" file.
```bash
docker pull michaellichtenecker/codesnipt:latest
docker run -d -p 0.0.0.0:29000:29000 -v ${PWD}/conf.toml:/conf.toml michaellichtenecker/codesnipt:latest
```

## Get started
After you followed the install instructions above, you are ready to configure the frontend.

So that the frontend is able to communicate with the backend, we need to specify the URL of the backend eg: https://example.com. 

Open the installed frontend and click on the settings tab.

Enter your correct backend URL in the host field and click on the update button.

Finally, you can start using the application.


## Techstack
- Rust(Rocket)
- Dart(Flutter)
- MongoDB

