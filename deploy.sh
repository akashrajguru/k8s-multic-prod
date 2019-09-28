docker build -t akash14/multi-client -f ./client/Dockerfile ./client
docker build -t akash14/multi-server -f ./server/Dockerfile ./server
docker build -t akash14/multi-worker -f ./worker/Dockerfile ./worker
docker push akash14/multi-client
docker push akash14/multi-server
docker push akash14/multi-worker
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=akash14/multi-server