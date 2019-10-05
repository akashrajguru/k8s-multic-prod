docker build -t akash14/multi-client:latest -t akash14/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t akash14/multi-server:latest -t akash14/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t akash14/multi-worker:latest -t akash14/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push akash14/multi-client:latest
docker push akash14/multi-server:latest
docker push akash14/multi-worker:latest

docker push akash14/multi-client:$SHA
docker push akash14/multi-server:$SHA
docker push akash14/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=akash14/multi-server:$SHA
kubectl set image deployments/client-deployment client=akash14/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=akash14/multi-worker:$SHA