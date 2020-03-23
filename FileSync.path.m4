include(`foreach.m4')dnl
[Unit]
Description=Path unit file for file sync

[Path]
foreach(`d', ( directories ), `PathChanged=d
')dnl

[Install]
WantedBy=paths.target
