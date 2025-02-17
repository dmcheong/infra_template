#!/bin/bash
#|# Script pour gérer Nginx avec CAST Framework
#|# @author Ton Nom
#|# @description Gestion de Nginx avec start, stop et restart
#|# @usage ./script.sh {start|stop|restart}

Function_Name="${FUNCNAME[0]}"
Function_PATH="${Function_PATH}/${Function_Name}"

start_nginx() {
    #|# Démarre le service Nginx
    #|# @usage start_nginx
    #|# @return 0 si succès, 1 sinon

    ############ STACK_TRACE_BUILDER #####################
    Function_Name="${FUNCNAME[0]}"
    Function_PATH="${Function_PATH}/${Function_Name}"
    ######################################################

    MSG_DISPLAY "check" "0" "Démarrage de Nginx"
    systemctl start nginx
    CTRL_Result_func "${?}" "Nginx démarré avec succès" "Échec du démarrage" "1"

    ############### Stack_TRACE_BUILDER ################
    Function_PATH="$( dirname ${Function_PATH} )"
    ####################################################
}

stop_nginx() {
    #|# Arrête le service Nginx
    #|# @usage stop_nginx
    #|# @return 0 si succès, 1 sinon

    ############ STACK_TRACE_BUILDER #####################
    Function_Name="${FUNCNAME[0]}"
    Function_PATH="${Function_PATH}/${Function_Name}"
    ######################################################

    MSG_DISPLAY "check" "0" "Arrêt de Nginx"
    systemctl stop nginx
    CTRL_Result_func "${?}" "Nginx arrêté avec succès" "Échec de l'arrêt" "1"

    ############### Stack_TRACE_BUILDER ################
    Function_PATH="$( dirname ${Function_PATH} )"
    ####################################################
}

case "$1" in
    start) start_nginx ;;
    stop) stop_nginx ;;
    restart)
        stop_nginx
        start_nginx
        ;;
    *)
        echo "Usage: $0 {start|stop|restart}"
        exit 1
        ;;
esac
