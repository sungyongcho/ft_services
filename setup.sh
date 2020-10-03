#!/bin/sh

echo "
    ______                            _
   / __/ /_     ________  ______   __(_)_______  _____
  / /_/ __/    / ___/ _ \/ ___/ | / / / ___/ _ \/ ___/
 / __/ /_     (__  )  __/ /   | |/ / / /__/  __(__  )
/_/  \__/____/____/\___/_/    |___/_/\___/\___/____/
       /_____/

		                            - by sucho
                            (sucho@student.42seoul.kr)\n\n"

# 이미지 생성
echo "hello"
sh ./srcs/update_packages.sh
# deployment 생성
docker build -t service-nginx ./srcs/nginx/
docker build -t service-ftps ./srcs/ftps/
docker build -t service-mysql ./srcs/mysql/
docker build -t service-phpmyadmin ./srcs/phpmyadmin/
docker build -t service-wordpress ./srcs/wordpress/
docker build -t service-influxdb ./srcs/influxdb/
docker build -t service-grafana ./srcs/grafana/
docker build -t service-telegraf ./srcs/telegraf/

# # kubernetes dashboard
# ##kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
# ##kubectl proxy > /dev/null

kubectl apply -f https://raw.githubusercontent.com/google/metallb/v0.8.1/manifests/metallb.yaml
kubectl apply -f ./srcs/metallb_config.yaml
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
