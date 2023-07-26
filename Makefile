.PHONY: all update install validate bundle server client docs

all: install validate bundle server client docs

update:
	@docker run --rm -v "${PWD}:/tmp/openapi" node:lts-alpine \
		sh -c "cd /tmp/openapi && npm update"

install:
	@docker run --rm -v "${PWD}:/tmp/openapi" node:lts-alpine \
		sh -c "cd /tmp/openapi && npm install"

validate: install
	@docker run --rm -v "${PWD}:/tmp/openapi" node:lts-alpine \
		sh -c "cd /tmp/openapi && npm run test"

bundle: validate
	@docker run --rm -v "${PWD}:/tmp/openapi" node:lts-alpine \
        sh -c "cd /tmp/openapi && npm run build"

server: bundle
	@docker run --rm -v "${PWD}:/tmp/openapi" openapitools/openapi-generator-cli:latest-release generate \
    -i /tmp/openapi/tmp/openapi.yaml \
    -g spring \
    -o /tmp/openapi/generated/spring \
    --additional-properties useBeanValidation,requestMappingMode=api_interface \

client: bundle
	@docker run --rm -v "${PWD}:/tmp/openapi" openapitools/openapi-generator-cli:latest-release generate \
    -i /tmp/openapi/tmp/openapi.yaml \
    -g dart \
    -o /tmp/openapi/generated/dart \

docs: bundle
	@docker run --rm -v "${PWD}:/tmp/openapi" openapitools/openapi-generator-cli:latest-release generate \
    -i /tmp/openapi/tmp/openapi.yaml \
    -g dynamic-html \
    -o /tmp/openapi/generated
