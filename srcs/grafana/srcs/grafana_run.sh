#!/bin/sh
rc-status

grafana-server --config=/etc/grafana.ini --homepath=/usr/share/grafana
