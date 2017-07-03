#!/bin/bash
source app.env

cp ../target/${APP_NAME}.war ${CATALINA_BASE}/webapps/ROOT.war
