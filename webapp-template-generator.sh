#!/bin/bash
#
# Display Help message
#
function HELP() {
  echo "Usage: $0 -w /path/to/workspace"
  echo "Usage: $0 -n app_name"
  echo "Usage: $0 -g maven group id"
}

while getopts w:n:g:h FLAG; do
  case $FLAG in
    w)
      WORKSPACE=$OPTARG
      ;;
    n)
      APP_NAME=$OPTARG
      ;;
    g)
      GROUP_ID=$OPTARG
      ;;
    h)
      HELP
      ;;
    \?) #unrecognized option - show help
      echo -e \\n"Option -$OPTARG not allowed."
      HELP
      ;;
  esac
done

if [ "${WORKSPACE}" == "" ]; then
  echo "-w WORKSPACE is not defined."
  HELP
  exit 1
fi

if [ "${APP_NAME}" == "" ]; then
  echo "-n APP_NAME is not defined."
  HELP
  exit 1
fi

if [ "${GROUP_ID}" == "" ]; then
  echo "-n GROUP_ID is not defined."
  HELP
  exit 1
fi

APP_WORKSPACE=${WORKSPACE}/${APP_NAME}
SCRIPT_DIR=${APP_WORKSPACE}/scripts
mkdir -p ${SCRIPT_DIR}

echo "Create build.sh."
cp ./templates/build.sh ${SCRIPT_DIR}

echo "Create deploy.sh."
cp ./templates/deploy.sh ${SCRIPT_DIR}

echo "Create maven strucutre."
mkdir -p ${APP_WORKSPACE}/src/main/java
mkdir -p ${APP_WORKSPACE}/src/main/resources
mkdir -p ${APP_WORKSPACE}/src/test/java
mkdir -p ${APP_WORKSPACE}/src/test/resources

sed -e "s/\${GROUP_ID}/${GROUP_ID}/" \
    -e "s/\${ARTIFACT_ID}/${APP_NAME}/" \
    -e "s/\${APP_NAME}/${APP_NAME}/" \
    ./templates/maven/pom.xml > ${APP_WORKSPACE}/pom.xml
