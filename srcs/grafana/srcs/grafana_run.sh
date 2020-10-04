#!/bin/sh
rc-status

rm -rf /var/lib/grafana/sessions

grafana-server --config=/etc/grafana.ini --homepath=/usr/share/grafana
