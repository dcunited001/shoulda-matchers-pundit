source 'https://rubygems.org'
gemspec

group :development do

  gem 'foreman', '~> 0.62.0'
  gem 'guard', '~> 1.6.2'
  gem 'guard-minitest', '~> 0.5.0'
  gem 'pry'

  gem 'rspec-web', github: 'dcunited001/rspec-web'
  gem 'minitest-reporters-ws', "~> 0.0.2"

  if RbConfig::CONFIG['target_os'] =~ /linux/i
    gem 'rb-inotify', require: false
    gem 'ruby_gntp'
  end

  if RbConfig::CONFIG['target_os'] =~ /darwin/i
    gem 'rb-fsevent', require: false
    gem 'growl'
  end

  if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
    gem 'wdm', require: false, platforms: [:mswin, :mingw]
    gem 'rb-notifu', platforms: [:mswin, :mingw]
  end

end
