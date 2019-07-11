

# 1 - Construir la imagen de docker de mi app

docker build -t miapp .

# 2 - Ejecutar y probar que la imagen funciona

docker run -ti miapp

# 3 - Subir imagen de docker a dockerhub

docker build -t boyander/miapp .
docker push boyander/miapp
