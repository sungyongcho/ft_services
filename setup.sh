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

#kubernetes dashboard
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.4/aio/deploy/recommended.yaml
kubectl proxy & # & <-role of ampersand!!!
sleep 3
echo "access to below address with following token (str8 copy and paste)"
echo "=====================token==================="
echo "\n"
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard-token | awk '{print $1}') | grep token: | awk '{print $2}'
echo "\n"
echo "============================================="
echo "\n"
echo "==============dashboard address=============="
echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
echo "============================================="

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

echo "
 ____    _    ____  _   _ ____   ___    _    ____  ____
|  _ \  / \  / ___|| | | | __ ) / _ \  / \  |  _ \|  _ \\
| | | |/ _ \ \___ \| |_| |  _ \| | | |/ _ \ | |_) | | | |
| |_| / ___ \ ___) |  _  | |_) | |_| / ___ \|  _ <| |_| |
|____/_/   \_\____/|_| |_|____/ \___/_/   \_\_| \_\____/
"
echo
"
 ____  _____ __  __ ___ _   _ ____  _____ ____
|  _ \| ____|  \/  |_ _| \ | |  _ \| ____|  _ \\
| |_) |  _| | |\/| || ||  \| | | | |  _| | |_) |
|  _ <| |___| |  | || || |\  | |_| | |___|  _ <
|_| \_\_____|_|  |_|___|_| \_|____/|_____|_| \_\\
"
echo "=====================token==================="
echo "access to below address with following token (str8 copy and paste)"
echo "=====================token==================="
echo "\n"
kubectl -n kubernetes-dashboard describe secret $(kubectl -n kubernetes-dashboard get secret | grep kubernetes-dashboard-token | awk '{print $1}') | grep token: | awk '{print $2}'
echo "\n"
echo "============================================="
echo "\n"
echo "==============dashboard address=============="
echo "http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/"
echo "============================================="

echo "Have Fun! ;)"
echo "
    ______                            _
   / __/ /_     ________  ______   __(_)_______  _____
  / /_/ __/    / ___/ _ \/ ___/ | / / / ___/ _ \/ ___/
 / __/ /_     (__  )  __/ /   | |/ / / /__/  __(__  )
/_/  \__/____/____/\___/_/    |___/_/\___/\___/____/
       /_____/
		                            - by sucho
                            (sucho@student.42seoul.kr)\n\n"
