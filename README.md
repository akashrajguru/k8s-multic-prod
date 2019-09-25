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

