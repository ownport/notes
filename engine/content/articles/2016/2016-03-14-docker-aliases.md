Title: Docker aliases/functions
Date: 2016-03-14 23:01
Tags: docker, alias

The content of .bashrc file:

```sh
# ----------------------------------------------------------------------
# Docker aliases/functions
#

d-help() { declare -F | grep d- | cut -d " " -f 3; }

# remove exited containers
d-rm-ec() {
    EXITED_CONTAINERS=$(docker ps -a | grep Exited | cut -d " " -f 1;);
    if [ -z $EXITED_CONTAINERS ];
    then
        echo "No exited containers";
    else
        docker rm $EXITED_CONTAINERS;
    fi
}

# remove none images
d-rm-ni() {
    NONE_IMAGES=$(docker images | grep "^<none>" | awk '{print $3}' )
    if [ -z $NONE_IMAGES ];
    then
        echo "No none images";
    else
        docker rmi $NONE_IMAGES;
    fi
}

# get container's IP address
d-ip() { docker inspect --format '{{ .NetworkSettings.IPAddress }}' $1; }

# get docker images
d-im() { docker images; }

# get all container processes
d-ps-a() { docker ps -a; }

# run interactive container
d-run-i() { docker run -ti --rm $@; }

# execute interactive container
d-ex-i() { docker exec -ti $@; }
```

### Links

- [tcnksm/docker-alias](https://github.com/tcnksm/docker-alias) Docker alias and functions
- [Useful Docker Bash Functions And Aliases](http://kartar.net/2014/03/useful-docker-bash-functions-and-aliases/)
- [15 Quick Docker Tips](https://www.ctl.io/developers/blog/post/15-quick-docker-tips/)
- [Docker Completion](https://github.com/docker/docker/tree/master/contrib/completion)
- [Docker Cheat Sheet](https://github.com/wsargent/docker-cheat-sheet)
