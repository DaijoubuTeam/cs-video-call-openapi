# CS Video Call OpenAPI

The API specification for CS Video Call.

## Working on the specification

This project is uses the [OpenAPI 3](https://swagger.io/docs/specification/about/) specification. Before contributing, please read the [guideline](src/README.md) located in the `src` folder.

You do not need any specialised tools to work on it. However, I would recommend using [VS Code](https://code.visualstudio.com/) with [OpenAPI (Swagger) Editor extension](https://marketplace.visualstudio.com/items?itemName=42Crunch.vscode-openapi) by 42Crunch to provide linting and auto-complete.

## Generating the server code

For any changes you make to the OpenAPI specification in the *master* branch, the respective server/client code will be generated in the *gen/\** branches. This is done automatically via GitHub Actions.

If you would like to generate the server/client code on your own computer, there are 2 ways to do it.

### Using Docker (Recommended)

1. Install and launch [Docker](https://docs.docker.com/get-docker/)
1. Run the following command

    ```bash
    make server
    ```

    ```bash
    make client
    ```

    > For Windows, you will need GNU Make installed, if not, copy the command from the `Makefile`.

### Using CLI

1. you need to follow the instructions to obtain the [OpenAPI Generator](https://github.com/OpenAPITools/openapi-generator).
1. Run the CLI with the parameters found in the `Makefile`
