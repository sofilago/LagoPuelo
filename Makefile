	
deploy:
	ssh root@marsala.neuroglia.com.ar mkdir /var/www/vhosts/lago.com.ar/httpdocs/tmp-puelo/
	rsync -avz --cvs-exclude --exclude=node_modules --exclude=data --exclude=vendor ./* root@marsala.neuroglia.com.ar:/var/www/vhosts/lago.com.ar/httpdocs/tmp-puelo/
	ssh root@marsala.neuroglia.com.ar chown -R lago:psacln  /var/www/vhosts/lago.com.ar/httpdocs/tmp-puelo/

startServer:
	php -S localhost:8086 



e2e:
	testcafe chrome test/e2e.js --app "php -S  localhost:8085"



getProdData:
	rsync -avz --cvs-exclude root@marsala.neuroglia.com.ar:/var/www/vhosts/lago.com.ar/horticultura.lago.com.ar/data ./


getVotes:
	scp root@marsala.neuroglia.com.ar:/var/www/vhosts/lago.com.ar/horticultura.lago.com.ar/votes.json ./

getLogs:
	mkdir -p logs
	rsync -avz --cvs-exclude root@marsala.neuroglia.com.ar:/var/www/vhosts/lago.com.ar/logs/horticultura.lago.com.ar/*_log ./logs



clean:
	rm -rf data/0*
