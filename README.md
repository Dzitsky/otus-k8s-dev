# otus-k8s-dev

1.) Авторизоваться на Docker Hub: 

https://hub.docker.com/

2.) Опубликовать образ: 

docker login
docker build ./ -t dzitskiy/promocode-factory-api
docker push dzitskiy/promocode-factory-api

3.) Используем образ dzitskiy/promocode-factory-api для конфигурации k8s
