# Arkis API Documentation
[![Circle CI](https://circleci.com/gh/ContainerHQ/arkis-api-docs.svg?style=svg)](https://circleci.com/gh/ContainerHQ/arkis-api-docs)

This documentation is written using
[Markdown](https://guides.github.com/features/mastering-markdown/).

## Hack

To hack on this documentation, you can directly use any markdown editor of
your choice (including directly editing the file on GitHub).

This documentation is built using [Slate](https://github.com/tripit/slate/).

If you want to preview a live version of this documentation, all you need
is [Docker](http://www.docker.com) and [Make](http://www.gnu.org/software/make/).

### Run the documentation server inside a container

    make

### Clean the container

    make clean

### Rebuild and restart the documentation server

    make re

### Run a development environment

    make dev

Then you should be able to start the documentation server with:

    bundle exec middleman server

The project directory is mounted inside a volume, allowing to change files
without leaving the container.

### Open the documentation

The documentation should be running on your Docker host and available at:

    http://$(your-docker-ip):$PORT

You can run the documentation server on another port of your Docker host
by specifying the environment variable `PORT` (default: `4567`) before any
of the previous commands (except clean).

### Deployment

 The documentation is automatically deployed on
[GitHub Pages](https://pages.github.com/) when something happen on the
master branch.

## Contributing

See the contributing [guidelines](CONTRIBUTING.md).

## Licensing
arkis-api-docs is licensed under the MIT License. See [LICENSE](LICENSE) for
full license text.
