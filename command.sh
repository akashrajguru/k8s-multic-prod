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
