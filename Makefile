pkg:
	gem build poise-languages.gemspec
	gem install --user-install *.gem
	bundle exec rake build
