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

