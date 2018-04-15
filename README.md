# Catalina Template Generator

Catalina Template Generator is a set of bash scripts to generate catalina web template.

## Requirements

- apache tomcat 8 is already installed
- jdk 8 is already installed

## Recommendated

- apache maven 3 is already installed

## Usage

### Generate a web application base directory with basic configuration files.

Run `catalina-template-generator.sh` with following switches.

- -b the catalina base directory
- -c catalina home directory
- -n application name

Example:

```sh
NAME=my_web \
CATALINA_HOME=/opt/tomcat/apache-tomcat-8.5.8 \
BASE_DIR=~/web && \
./catalina-template-generator.sh -b ${BASE_DIR} -c ${CATALINA_HOME} -n ${NAME}
```

### Generate a maven based Java project directory with build scripts.

Run `webapp-template-generator.sh` with following switches

- -w workspace directory where project will be created
- -g group id for maven
- -n application name

```sh
NAME=my_web \
WORKSPACE=~/workspace \
GROUP_ID=com.djd.fun && \
./webapp-template-generator.sh -w ${WORKSPACE} -n ${NAME} -g ${GROUP_ID}
```
