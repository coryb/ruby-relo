VERSION=2.4.0
CRAZYDIR=/Users/ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1
OSXVER=$(subst $(noop) ,.,$(wordlist 1, 2, $(subst ., ,$(shell sw_vers -productVersion))))
ruby:
	sudo ln -s /Users/travis $(CRAZYDIR)
	whoami
	pwd
	ls -l /Users/travis
	ls -l $(CRAZYDIR)
	mkdir -p $(CRAZYDIR)/.rbenv/versions/
	ruby-build $(VERSION) $(CRAZYDIR)/.rbenv/versions/rubytemp --verbose
	cp ./relocate $(CRAZYDIR)/.rbenv/versions/rubytemp/.
	cd $(CRAZYDIR)/.rbenv/versions/rubytemp && tar -cyf $(TRAVIS_BUILD_DIR)/ruby-$(VERSION)-osx-$(OSXVER).tar.bz2 *
	@curl -T $(TRAVIS_BUILD_DIR)/ruby-$(VERSION)-osx-$(OSXVER).tar.bz2 -ucoryb:$(BINTRAY_API_KEY) https://api.bintray.com/content/coryb/ruby-relo/ruby-tarballs/0.0.1/osx/$(OSXVER)/ruby-$(VERSION)-osx-$(OSXVER).tar.bz2
	@curl -X POST -ucoryb:$(BINTRAY_API_KEY) https://api.bintray.com/content/coryb/ruby-relo/ruby-tarballs/0.0.1/publish

osxver:
	echo $(OSXVER)
