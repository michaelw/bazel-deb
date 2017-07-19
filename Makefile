ZIP := bazel-$(BASEVERSION)-dist.zip
URL := https://github.com/bazelbuild/bazel/releases/download/$(BASEVERSION)/$(ZIP)

all: download
	unzip -d bazel $(ZIP)
	cd bazel && bash ./compile.sh

download: $(ZIP)

install:
	install -D --mode 0644 bazel/output/bazel $(DESTDIR)/usr/bin/bazel

clean:
	$(RM) -r bazel $(ZIP)

$(ZIP):
	wget --no-verbose --no-check-certificate --no-cookies $(URL)

.PHONY: all download clean
.DELETE_ON_ERROR:
