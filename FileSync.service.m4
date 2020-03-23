include(`foreach.m4')dnl
[Unit]
Description=Unit file to synchronise files in the home directory

[Service]
ExecStart=/bin/sh -c 'foreach(`dir', (directories), `/usr/bin/unison -batch dir destination/dir; ')'

[Install]
WantedBy=default.target
