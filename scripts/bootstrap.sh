#!/bin/bash

echo "Project bootstrap"

terraform init

terraform validate

ansible-playbook --syntax-check ansible/site.yml
