[![Build Status](https://travis-ci.org/dcunited001/shoulda-matchers-pundit.png)](https://travis-ci.org/dcunited001/shoulda-matchers-pundit)

# Shoulda::Matchers::Pundit

TODO: update readme: description, installation, usage
TODO: Configure Travis
TODO: Configure Appraisal?
TODO: file to load matcher for RSpec & integration test & test task
TODO: file to load matcher for Cucumber & integration test & test task
TODO: relocate dev dependencies from Gemfile to Gemspec
TODO: Change gemspec dependencies to work with older versions of shoulda-matchers & pundit
TODO: allow configurable error messages per suite & per spec file?
TODO: add aliases to PermittedToMatcher?
TODO: add ForbidMatcher & ForbiddenToMatcher? (& update integration tests)
TODO: find a way to remove the constraint that a policy's record must be named record

## Installation

Add this line to your application's Gemfile:

    gem 'shoulda-matchers-pundit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shoulda-matchers-pundit

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull

## Changelog

#### 0.0.2

* Added ForbidMatcher.  May add ForbiddenToMatcher later on.
* Match multiple actions with a single permit/forbid statement

#### 0.0.1

* Added PermitMatcher & PermittedToMatcher.
