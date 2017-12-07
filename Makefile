CONTAINER = mailtop/rabbitmq
RABBITMQ_HIPE_COMPILE = 1
RABBITMQ_DEFAULT_USER = mailtop
RABBITMQ_DEFAULT_PASS = viopoine

DRUN = docker run -it --rm \
		--hostname rabbit-local \
		--name rabbit-local \
		-e RABBITMQ_HIPE_COMPILE=$(RABBITMQ_HIPE_COMPILE) \
		-e RABBITMQ_DEFAULT_USER=$(RABBITMQ_DEFAULT_USER) \
		-e RABBITMQ_DEFAULT_PASS=$(RABBITMQ_DEFAULT_PASS) \
		-p 0.0.0.0:5672:5672 \
		-p 0.0.0.0:15672:15672 \
		$(CONTAINER)

.PHONY : docker bash run clean upload

docker:
	bash bin/get-files.sh
	docker build -t $(CONTAINER) .

bash:
	$(DRUN) bash

run:
	$(DRUN)

clean:
	docker rmi $(CONTAINER)
	docker system prune --volumes --force

upload:
	docker login -u mailtop
	docker push $(CONTAINER):latest
