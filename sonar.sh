#!/bin/bash  

server_root=./

start() {
	cd $server_root
	docker compose up -d && sleep 5 && nerdctl exec -u root -it sonarqube-v10.5.1 chmod 777 -R /etc/hosts
}

stop() {
	cd $server_root
	docker compose down 
}
status() {
	docker ps | grep sonarqube-v10.5.1
}
logs() {
	docker logs -f sonarqube-v10.5.1
}

case "$1" in 
	start)   	start ;;
	stop)    	stop ;;
	restart) 	stop; start ;;
	status)		status ;;
	logs)		logs ;;
	*) echo 	"Usage: $0 start|stop|restart|status|logs" >&2
		   		exit 1
		   		;;
esac
