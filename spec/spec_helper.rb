require 'minitest/autorun'
require 'minitest/matchers'
require "pry"

require "pundit"
require "active_model/naming"

require 'shoulda/matchers/pundit/minitest'

if ENV['MINITESTREPORTER']
  require "minitest/reporters"
  require "minitest/reporters/ws"

  reporter = case ENV['MINITESTREPORTER']
             when 'ws' then MiniTest::Reporters::Ws::Reporter.new
             when 'spec' then MiniTest::Reporters::SpecReporter.new
             else MiniTest::Reporters::ProgressReporter.new
  end

  Minitest::Reporters.use! reporter
end

class ArticlePolicy < Struct.new(:user, :record)

  def create?
    true if user
  end

  def update?
    user && (record.user_id == user.id)
  end

  def destroy?
    false
  end

  def show?
    true
  end

end

class Article
  attr_accessor :user_id
  def initialize(user)
    @user_id = user.id if user
  end
end

class User
  attr_accessor :id
  def initialize(id)
    @id = id
  end
end
