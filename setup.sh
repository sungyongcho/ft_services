#!/bin/sh

echo "
    ______                            _
   / __/ /_     ________  ______   __(_)_______  _____
  / /_/ __/    / ___/ _ \/ ___/ | / / / ___/ _ \/ ___/
 / __/ /_     (__  )  __/ /   | |/ / / /__/  __(__  )
/_/  \__/____/____/\___/_/    |___/_/\___/\___/____/
       /_____/

		                       (with minikube)
		                            - by sucho
                            (sucho@student.42seoul.kr)\n\n"

# 이미지 생성
echo "hello"
echo "kubernetes docker-desktop ver. script is available at ./tmp/ , in case."
echo "gogo"

# check & update phpymdamin and wordpress
sh ./srcs/update_packages.sh

# minikube
minikube start --driver=virtualbox

# MetalLB
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl diff -f - -n kube-system
kubectl get configmap kube-proxy -n kube-system -o yaml | \
sed -e "s/strictARP: false/strictARP: true/" | \
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f ./srcs/metallb_config.yaml

# minikube pt. 2 - set minikube as k8s cluster env.
eval $(minikube docker-env)

# build images
docker build -t service-nginx ./srcs/nginx/
docker build -t service-ftps ./srcs/ftps/
docker build -t service-mysql ./srcs/mysql/
docker build -t service-phpmyadmin ./srcs/phpmyadmin/
docker build -t service-wordpress ./srcs/wordpress/
docker build -t service-influxdb ./srcs/influxdb/
docker build -t service-grafana ./srcs/grafana/
docker build -t service-telegraf ./srcs/telegraf/

echo "image built succesfully."


# for cluster
kubectl create configmap nginx-configmap --from-file=./srcs/nginx/srcs/default.conf --from-file=./srcs/nginx/srcs/proxy.conf
kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/influxdb/influxdb.yaml
kubectl apply -f ./srcs/influxdb/influxdb_conf.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml
kubectl apply -f ./srcs/telegraf/telegraf.yaml

minikube dashboard --url

echo "Have Fun! ;)"

echo "
    ______                            _
   / __/ /_     ________  ______   __(_)_______  _____
  / /_/ __/    / ___/ _ \/ ___/ | / / / ___/ _ \/ ___/
 / __/ /_     (__  )  __/ /   | |/ / / /__/  __(__  )
/_/  \__/____/____/\___/_/    |___/_/\___/\___/____/
       /_____/

		                       (with minikube)
		                            - by sucho
                            (sucho@student.42seoul.kr)\n\n"
