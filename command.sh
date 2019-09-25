# Delete the old deployment
#list deployemnts 
kubectl get deployments
# Delete deployemt 
kubectl delete deployment client-deployment
# Get list of services 
kubectl get services
# delete services 
kubectl delete service <service_name>


### Apply 
kubectl apply -f k8s/client-deployment.yml

# Apply group 
kubectl apply -f k8s

#
kubectl get deployments

#List different options available for storage on host machine(pc)
kubectl get storageclass

# 
kubectl describe storageclass

#Create Secret
kubectl create secret generic pgpassword --from-literal PGPASSWORD=<password>

# verify secret
kubectl get secrets

# Enabling Ingress Locally
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/mandatory.yaml

minikube addons enable ingress

## step 1 
kubectl create secret generic pgpassword --from-literal PGPASSWORD=<password>
## step 2
kubectl apply -f k8s
