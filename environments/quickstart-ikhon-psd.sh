#!/bin/bash
NN="\e[0m";RN="\e[0;31m";GN="\e[0;32m";BN="\e[0;34m";YN="\e[0;33m";CN="\e[0;36m";MN="\e[0;35m";WN="\e[0;37m";
NB="\e[1m";RB="\e[1;31m";GB="\e[1;32m";BB="\e[1;34m";YB="\e[1;33m";CB="\e[1;36m";MB="\e[1;35m";WB="\e[1;37m";

OPTERR=0

while getopts b: FLAGS
do
    case $FLAGS in
        'b')
            OPCAO=1
            BRANCH="$OPTARG"
            ;;
        --)
            OPCAO=1
            break
            ;;
    esac
done

if [ $OPCAO ]
then
    echo
    echo -e "$GB+--------------------------------------------------+"
    echo -e "| CLONANDO A BRANCH '$BRANCH'"
    echo -e "+--------------------------------------------------+$NN"
    echo

    git clone --branch $BRANCH --recurse-submodules https://github.com/sigilodigital/ikhon-psd-api-config-gerais ../api-config-gerais && \
    git clone --branch $BRANCH --recurse-submodules https://github.com/sigilodigital/ikhon-psd-api-dados-gerais ../api-dados-gerais && \
    git clone --branch $BRANCH --recurse-submodules https://github.com/sigilodigital/ikhon-psd-api-gestao-acesso ../api-gestao-acesso && \
    git clone --branch $BRANCH --recurse-submodules https://github.com/sigilodigital/ikhon-psd-api-gestao-tomador-servicos ../api-gestao-tomador-servicos && \
    git clone --branch $BRANCH --recurse-submodules https://github.com/sigilodigital/ikhon-psd-portal-front ../portal-front

    exit 0
fi

if [ $opcao_2 ]
then
    echo
    echo "+--------------------------------------------------+"
    echo "| Outra opcao:"
    echo "+--------------------------------------------------+"
    echo
    exit 0
fi

################################################
echo
echo -e "$BB+$BB --------------------------------------------------+$NN"
echo -e "$BB|$RB Erro ao tentar executar o script$NN" 
echo -e "$BB|$NN"
echo -e "$BB|$GB Sintaxe do script:$NN" 
echo -e "$BB|$YN ./$(basename $0) -b <NOME_DA_BRANCH>"
echo -e "$BB|$NN"
echo -e "$BB|$GB Exemplos de uso:$NN"
echo -e "$BB|$YN ./$(basename $0) -b main$NN"
echo -e "$BB|$YN ./$(basename $0) -b develop$NN"
echo -e "$BB|$YN ./$(basename $0) -b hepc/alternative$NN"
echo -e "$BB+$BB --------------------------------------------------+$NN"
echo
exit 0
