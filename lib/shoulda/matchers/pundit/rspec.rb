require 'shoulda/matchers/pundit'

if defined?(Pundit)
  Shoulda::Matchers::Pundit.module_eval do
    def self.included(base)
      instance_methods.each do |name|
        base.register_matcher name, name
      end
    end
  end

  RSpec.configure do |config|
    config.include Shoulda::Matchers::Pundit
  end
end
