# aholten's local k8s demo repo

As part of learning Kubernetes and studying for the CKAD exam, I configured k8s locally on my machine using this set up. The specific goal I had in mind was to deploy a containerized HTTP server program and expose it to the web from my local machine. The tools I'm using here are just one way to accomplish this goal, but it should be simple enough to follow along and is totally free, though you may need to make an account to use `ngrok`. 

For reference, my machines use Apple Silicon chips (an M1 MacBook Pro and an M2 Mac Mini). 

## Setup

First, let's install the tools we will be using: Docker, Minikube, and ngrok.

### Mac Instructions
If you have [Homebrew](https://brew.sh/) already installed on your Mac, just run the included bash script `brew_installer.sh`. This installs all three components.

### Other OS Instructions
- Docker
   - [Windows installation](https://docs.docker.com/desktop/install/windows-install/)
   - [Linux installation](https://docs.docker.com/desktop/install/linux-install/)

 - Minikube
    -  [Cross-OS install](https://minikube.sigs.k8s.io/docs/start/)

 - ngrok
     - [Cross-OS install](https://ngrok.com/download)

## First Time Deployment
 - Start Docker Desktop
 - Run `build_and_deploy.sh` <details> <summary>(you should see something like this)</summary> 
    ```
    😄  minikube v1.31.2 on Darwin 13.5.1 (arm64)
    ✨  Automatically selected the docker driver
    📌  Using Docker Desktop driver with root privileges
    👍  Starting control plane node minikube in cluster minikube
    🚜  Pulling base image ...
    💾  Downloading Kubernetes v1.27.4 preload ...
        > preloaded-images-k8s-v18-v1...:  327.74 MiB / 327.74 MiB  100.00% 2.11 Mi
        > gcr.io/k8s-minikube/kicbase...:  404.50 MiB / 404.50 MiB  100.00% 2.44 Mi
    🔥  Creating docker container (CPUs=2, Memory=4000MB) ...
    🐳  Preparing Kubernetes v1.27.4 on Docker 24.0.4 ...
        ▪ Generating certificates and keys ...
        ▪ Booting up control plane ...
        ▪ Configuring RBAC rules ...
    🔗  Configuring bridge CNI (Container Networking Interface) ...
        ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    🔎  Verifying Kubernetes components...
    🌟  Enabled addons: storage-provisioner
    🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
    [+] Building 18.9s (8/8) FINISHED                                                                                                 docker:default
    => [internal] load build definition from Dockerfile        0.0s
    => => transferring dockerfile: 133B                         0.0s
    => [internal] load .dockerignore                            0.0s
    => => transferring context: 2B                              0.0s
    => [internal] load metadata for docker.io/oven/bun:1.0.3     1.2s
    => [1/3] FROM docker.io/oven/bun:1.0.....

    What's Next?
    View a summary of image vulnerabilities and recommendations → docker scout quickview
    deployment.apps/bun-http-server created
    service/bun-http-server created
    pod/bun-http-server-6cf795c4d-g2wln condition met
    pod/bun-http-server-6cf795c4d-s54k6 condition met
    Forwarding from 127.0.0.1:3000 -> 3000
    Forwarding from [::1]:3000 -> 3000
    ``` 
</details>

 - You can now access the http server at localhost:3000 !!!
   - It should say `You just deployed an HTTP server to the web with k8s!`

 - If you want to expose your local server to the open web:
   - Open a new terminal window, as kubectl will be using the previous one
   - [Provide `ngrok` with your user token](https://ngrok.com/docs/secure-tunnels/ngrok-agent/tunnel-authtokens/): `ngrok config add-authtoken <YOUR_AUTHTOKEN>`
   - run `expose.sh`
   - The k8s cluster running on your local machine now is exposed to the world wide web with the forwarding URL from ngrok!
 - You're now free to break things and tinker with the k8s environment. Let me know if you run into any issues.