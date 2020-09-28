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
# deployment 생성
docker build -t service-mysql ./srcs/mysql/
docker build -t service-phpmyadmin ./srcs/phpmyadmin/

kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml

