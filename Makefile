bootstrap:
	./scripts/bootstrap.sh

terraform:
	cd terraform && terraform validate

ansible:
	ansible-playbook --syntax-check ansible/site.yml

lint:
	echo "Lint phase"

all: terraform ansible
