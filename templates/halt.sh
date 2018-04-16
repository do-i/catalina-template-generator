#!/bin/bash

source app.env
${CATALINA_HOME}/bin/shutdown.sh
rm ${CATALINA_BASE}/logs/*
