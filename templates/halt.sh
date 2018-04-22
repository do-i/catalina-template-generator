#!/bin/bash

source app.env
${CATALINA_HOME}/bin/shutdown.sh
rm -f ${CATALINA_BASE}/logs/*
