VERSION=2.4.0
CRAZYDIR=/Users/ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1ruby1
ruby:
	sudo ln -s $(CRAZYDIR) /Users/travis
	whoami
	pwd
	ls -l /Users/travis
	ls -l $(CRAZYDIR)
	mkdir -p $(CRAZYDIR/.rbenv/versions/
	ruby-build $(VERSION) $(CRAZYDIR)/.rbenv/versions/$(VERSION) --verbose
	tar -C $(CRAZYDIR) -cyf $(TRAVIS_BUILD_DIR)/ruby-$(VERSION).tar.bz2