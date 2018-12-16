docker build -t raman162/multi-client:latest -t raman162/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t raman162/multi-server:latest -t raman162/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t raman162/multi-worker:latest -t raman162/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push raman162/multi-client:latest
docker push raman162/multi-client:$SHA
docker push raman162/multi-server:latest
docker push raman162/multi-server:$SHA
docker push raman162/multi-worker:latest
docker push raman162/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=raman162/multi-server:$SHA
kubectl set image deployments/client-deployment client=raman162/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=raman162/multi-worker:$SHA
