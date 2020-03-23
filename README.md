file-sync
=========

These are some unit files that I use to synchronize folders
on my personal linux computers using `unison` (a fantastic
program btw). The problem is that I needed some way to
automatically generate the unit files based on a list of
directories that I specify. Turns out that gnu `make` and
gnu `m4` were the perfect tools for the job.

In the `Makefile` you just specify the folders that you want
to sync and adjust one or two variables as you need and then
```
make
```
will create your unit files, and finally
```
make install
```
will create the symlinks to your local systemd configuration
directory.
