Docker image that listens on a specified UDP port, outputs to container log.
Helm chart to package and deploy application to Elastic Kubernetes Service (EKS)

### Install using Helm

    cd deploy/udp-listener
    helm upgrade --install udp-listener .

### Uninstall using Helm

    helm uninstall udp-listener

### Start it locally

By default, you can run it like this

    docker run -p 0.0.0.0:5005:5005 -p 0.0.0.0:5005:5005/udp --name udp-listener coderiseio/udp-listener

You can make it listen on another port

    docker run -p 0.0.0.0:4444:4444 -p 0.0.0.0:4444:4444/udp -e UDPPORT=4444 --name udp-listener coderiseio/udp-listener

#### Test it

Use some tool like PacketSender or in another terminal:

    #localhost
    nc -u localhost 5005

And start sending data.  You should see your text reflected in the `docker run` terminal


### Docker Compose

```
udp:
  container_name: my-udp-listener
  image: coderiseio/udp-listener
  environment:
    - UDPPORT=4001
  ports:
  - "0.0.0.0:4001:4001"
  - "0.0.0.0:4001:4001/udp"

```

View its logs:

    docker logs <udp-listener-pod>
