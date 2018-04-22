#!/bin/bash

source app.env
# TODO parametalize jpda as $1
${CATALINA_HOME}/bin/catalina.sh jpda start
