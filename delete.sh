## delete dashboard

kubectl delete -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
## delete metallb
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl delete -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl delete -f ./srcs/metallb_config.yaml

## delete all components
kubectl delete --all deployment
kubectl delete --all services
kubectl delete --all secret
kubectl delete --all configmap
kubectl delete --all pv,pvc

##delete all docker images && containers (in case)
docker rmi $(docker images -q)
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
