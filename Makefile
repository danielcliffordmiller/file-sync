
user_home := /home/danmiller

to_synchronize := \
	$(user_home)/Documents/ \
	$(user_home)/vimwiki/

output_files := FileSync.path FileSync.service
unit_files := $(output_files) FileSync.timer

systemd_user_dir := .config/systemd/user

destination := ssh://augustus

directories := $(shell perl -e 'print join ",",@ARGV' -- $(to_synchronize))

.PHONY : all clean install

all: $(unit_files)

clean:
	rm -f -v $(output_files)

FileSync.%: FileSync.%.m4
	m4 -I /usr/share/doc/m4/examples \
		-D directories="$(directories)" \
		-D destination="$(destination)" \
		"$<" > "$@"

install:
	for f in $(unit_files); do \
		ln -s $(CURDIR)/$$f $(user_home)/$(systemd_user_dir)/$$f ;\
	done
