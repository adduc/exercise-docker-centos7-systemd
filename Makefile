IMAGE := adduc/exercise-systemd:centos7

build:
	docker build --ulimit nofile=1024000 -t $(IMAGE) .

delete:
	docker rmi $(IMAGE)