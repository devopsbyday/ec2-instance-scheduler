# use some sensible default shell settings
SHELL := /bin/bash
.SILENT:
.DEFAULT_GOAL := help


##@ Entry Points

.PHONY: init
init: ## Initialize Terraform. This should be done first.
	terraform init

.PHONY: plan
plan: ## Create a Terraform plan
	terraform plan

.PHONY: apply
apply: ## Apply the Terraform plan to create resources
	terraform apply

.PHONY: destroy
destroy: ## Destroy the Terraform-managed infrastructure
	terraform destroy

.PHONY: output
output: ## Output the current state
	terraform output

.PHONY: 
fmt: ## Format the Terraform files in a directory
	terraform fmt -recursive


.PHONY: validate
validate: ## Validate the Terraform files
	terraform validate  

##@ Misc
.PHONY: help
help: ## Display this help
	awk \
	  'BEGIN { \
	    FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n" \
	  } /^[a-zA-Z_-]+:.*?##/ { \
	    printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 \
	  } /^##@/ { \
	    printf "\n\033[1m%s\033[0m\n", substr($$0, 5) \
	  } ' $(MAKEFILE_LIST)

