require "pundit"
require "active_model/naming"
require "pry"

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
