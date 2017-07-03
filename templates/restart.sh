#!/bin/bash

source app.env
${CATALINA_HOME}/bin/shutdown.sh
${CATALINA_HOME}/bin/startup.sh
