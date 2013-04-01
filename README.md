[![Build Status](https://travis-ci.org/dcunited001/shoulda-matchers-pundit.png)](https://travis-ci.org/dcunited001/shoulda-matchers-pundit)

# Shoulda::Matchers::Pundit

Check out this Thunderbolt Labs blog post:

> http://thunderboltlabs.com/posts/testing-pundit-policies-with-rspec

A file to set up the matchers for rspec should be in the next version.  Until then, you can still add them yourself.

### Issues:

TODO: fix bundler dependancy problem!!
TODO: fix failure message for wont (doesn't output failing actions)

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

```
gem 'shoulda-matchers-pundit'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install shoulda-matchers-pundit
```

## Setup

Add the following to either your test/spec helper or to a support/minitest_matchers.rb file:

#### Minitest:

```
require 'shoulda/matchers/pundit/minitest'
```

#### Rspec: (adding in 0.0.3)

```
require 'shoulda/matchers/pundit/rspec'
```

## Usage

To speed up your Policy tests, assert assert multiple actions in a single permit/forbid.

The multiple actions are anded together, so use must/should, instead of wont/should_not.

#### PermitMatcher:

Ensures the policy permits a list of actions, given a user & record.

```
describe 'Article Creater' do
  let(:user) { User.new(1) }

  must { permit :create, :show, :update }
end
```

#### ForbidMatcher:

Ensures that the policy forbids a list of actions, given a user & record.

```
describe 'Guest' do
  let(:user) { nil }

  must { permit :show }
  must { forbid :create, :update, :destroy }
end

```

#### PermittedByMatcher:

Tests from the user's perspective.  I prefer to use the permit/forbid matchers and may remove this one.

```
describe 'Article Creator' do
  subject { User.new(1) }

  describe ArticlePolicy do
    must { be_permitted_to(:create).on(article) }
    must { be_permitted_to(:show).on(article) }
    must { be_permitted_to(:update).on(article) }
    wont { be_permitted_to(:destroy).on(article) }
  end
end
```

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
