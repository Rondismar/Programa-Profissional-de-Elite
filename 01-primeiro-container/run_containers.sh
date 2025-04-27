#!/bin/bash

# função para pausar o script
pausar () {
    echo -e "\nExecução do script pausada..."
    read -n 1 -s -p "Pressione qualquer tecla para continurar"
    echo -e "\n"
}
#Função para verificar se o comando foi executado com sucesso
verificar_erro(){
    if [ $? -ne 0 ]; then
        echo -e "\nErro: $1 falhou!"
        exit 1
    fi
}

echo -e "\n[1/5]Baxando a imagem do nginx...."
# faz o download da imagem do nginx
docker pull nginx

pausar

echo -e "\n[2/5] Iniciando novo container com o nome "meu_servidor"..."
# Inicia o container com o nome meu-servidor
docker container run -it --name meu-servidor -p 8080:80 -d nginx

pausar

echo -e "\n[3/5] Listando containers em execução..."
# Comando para listar todos os containes
docker container ls 

pausar

echo -e "\n[4/5] Parando o container..."
# parando o container
docker container stop meu-servidor 
verificar_erro "parar container"



# removendo o container 
docker container rm meu-servidor
verificar_erro "Remover container"

pausar 

echo -e "\n[5/5] listando todos os containers..."
# Comando para listar todos os containes
docker container ls 


echo -e "\n=== Script concluído com sucesso! ==="
