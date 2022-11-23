#!/bin/bash
#---------------------------------------------------------------------------------------------------------------#
# SCRIPT CRIACAO DE USUARIOS,DIRETORIOS,PERMISSOES
# AUTOR: RAMARTINS ROCHA DE ANDRADE
# DATA : 22/11/2022
# EMAIL: rarandrade@gmail.com
#---------------------------------------------------------------------------------------------------------------#
# CRIANDO DIRETORIOS #
if [ -d /publico ] && [ -d /adm ] && [ -d /ven ] && [ -d /sec ];
then
	echo " Diretorios já existem !!! "
else
	echo " Diretorio não existe criando diretorio ..."
	mkdir /publico /adm /ven /sec

	# CRIACAO DE GRUPOS #
	echo " Criando Grupos de Acessos ... "
	groupadd GRP_ADM 
	groupadd GRP_VEN 
	groupadd GRP_SEC
	echo " Grupos de Acessos Criados !!! "
	echo "---------------------------------------------------------------------------------------------------------"

	# CRIACAO DE USUARIO #
	echo " Criando Usuarios do Grupo Administrativo..."
	useradd carlos -c "Carlos Alberto" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM && passwd -e carlos
	useradd maria -c "Maria Silva" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM && passwd -e maria
	useradd joao -c "Joao Carlos" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_ADM && passwd -e joao
	echo " Criando Usuarios do Grupo Vendas..."
	useradd debora -c "Debora Alves" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN && passwd -e debora
	useradd sebastiana -c "Sebastiana Maria" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN && passwd -e sebastiana
	useradd roberto -c "Roberto Carlos" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_VEN && passwd -e roberto
	echo " Criando Usuarios do Grupo Secretariado..."
	useradd josefina -c "Josefina Regina" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC && passwd -e josefina
	useradd amanda -c "Amanda Prado" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC && passwd -e amanda
	useradd rogerio -c "Rogerio Silva" -m -s /bin/bash -p $(openssl passwd senha123) -G GRP_SEC && passwd -e rogerio
	echo " Usuarios Criados Com Sucesso !!!"
	echo "----------------------------------------------------------------------------------------------------------"

	# ALTERANDO PERMISSAO DOS DIRETORIOS #
	echo " Alterando os Grupos de Acesso aos Diretorios..."
	chown root:root /publico
	chown root:GRP_ADM /adm
	chown root:GRP_VEN /ven
	chown root:GRP_SEC /sec
	echo " Acessos Alterados !!! "
	echo "----------------------------------------------------------------------------------------------------------"
	echo " Alterando Permissões dos Diretorios... "
	chmod 777 /publico
	chmod 770 /adm
	chmod 770 /ven
	chmod 770 /sec
	echo " Permissões Alteradas !!! "
# FIM DO SCRIPT #
fi
