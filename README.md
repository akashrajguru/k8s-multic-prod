# Multi-container apps to Kuberneties

## Kuberneties services
  * Ingress Service
  * ClusterIP Service

##  Production Workflow 
  1. Create config files for each service and deployemt
  2. Test locally on minikube
  3. create a Github Tarvis flow to build images and deploy
  4. Deploy apps to AWS 

## Settingup application on Local kuberneties cluster (minikube)

## Kubernets Object types 
 * Pods : runs one or more tightly coupled containers
 * Services : Sets up networking in a kubernetes cluster
   * CluserIP : Exposes a set of pods to other objects in the cluster (used when applications/services are only to be accessed by application/services inside the cluser).  
   * NodePort : Exposes a set of pods to the outside world. 
   * LoadBalancer
   * Ingress

### CluserIP service
In kuberneties we use services for networking between objects such as single pod or a group of pods that are mannaged by deployment.

### Postgres PVC (persistent volume claim)
To keep postgres data persistent accross multi-restarts.

`Volume in docker`: reference to a type of data storage mechanism that allows a continer to store nad access data ousite od its own file system. 

`Volume in Kubernets`: reference to an object that allows a container to store and access data at the pod level. In kubernets volume is tied to the pods, if pod is destroyed, re-created or terminated the vloume associated with that pod is losed. Volume can only survive container restarts within pod.

##### Persisten Volume in Kubernetes
volume which is not tied to any specific pod or any specific conatiner (can be seen as long-term persisten storage). It is outside of the pod and completly seprated from the pod.

##### Persisten Volume Claim in Kubernetes
A persistent volume claim is a request for storage by a pod, similar to a pod requests compute resources. It provides an abstraction layer to underlying storage. For example, an administrator could create a number of static persistent volumes that can later be bound to one or more persistent volume claims. PVC can be statically provisioned (created ahead of time) or dynamically provisioned (created on the fly).

# Enabling Ingress Locally


# Production Deployemt steps
  1. Create Github Repo
  2. hook up repo to Tarvis CI
  3. Create Google Cloud project
  4. Enable billing for the project 
  5. Add deployment scripts to the repo

# Travis Config File
  1. Install Google Cloud SDK cli
  2. Configure the SDK without Google Cloud auth info
  3. Long to docker cli
  4. Build the test version of multi-client
  5. Run tests
  6. If tests are successful, run a script to deploy newest images
  7. Build all our images, tag each one, push each to docker hub
  8. Applt all configs in the k8s folder
  9. Imperatively set latest images on each deployment

#### Google cloud setup
  1. Create a Srvice account
  2. Download service account credentials in a json file
  3. Download and install the travis CLI
  4. Encrypy and upload the json file to our Travis account
  5. In travis.yml, add code to unencrypt the json file and load it into GCloud SDK
  6. Assigne secret to the Google cloud Cluster.
     1. Use Activate Cloud Shell to ssh into your GCloud project environment.
     2. `$ gcloud config set project project_id`
     3. `$ gcloud config set compute/zone hosted_zone` 
     4. `$ gcloud container clusters get-credentials cluster_name`
     5. `$ kubectl create secret generic pgpassword --from-literal PGPASSWORD=mypgpassword123`
     6. Install Helm
     7. `$ curl -LO https://git.io/get_helm.sh`
     8. `$ chmod 700 get_helm.sh`
     9. `$ ./get_helm.sh`
     10.  GKE Role-Based Access Control config with Helm [1]
     11.  Create a new service account colled 'tiller in a kube-system namespace.
     12.  `$ kubectl create serviceaccount --namespace kube-system tiller`
     13.  Cearte a new ClusterRoleDinding with a role 'cluster-admin' and assign it to service account 'tiller' 
     14.  `$ kubectl create clusterrolebinding tiller-cluster-rule --clusterrole=cluster-admin --serviceaccount=kube-system:tiller`
     15.  `$ helm init --service-account tiller --upgrade`
     16.  Use Helm to install ingress-nginx
     17.  `$ helm install stable/nginx-ingress --name my-nginx --set rbac.create=true` 
 
#### Travis setup inside docker container
  1. docker run -it -v $(pwd):/app ruby:2.3 sh
  2. Inside conatiner
     1. cd app
     2. gem install travis --no-document
     3. gem install taravis
     4. travis login
     5. copy json file into the volumed directory so we can use it in the container
     6. travis encript-file service-account.json

# References
[1] https://kubernetes.github.io/ingress-nginx/deploy/#using-helm

[2] https://helm.sh/docs/using_helm/#role-based-access-control 