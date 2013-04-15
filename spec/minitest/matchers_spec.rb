require 'spec_helper'

describe Shoulda::Matchers::Pundit::PermitMatcher do

  describe ArticlePolicy do

    subject { ArticlePolicy.new(user, article) }
    let(:article) { Article.new(user) }

    describe 'Guest' do
      let(:user) { nil }

      must { permit :show }
    end

    describe 'Any User' do
      let(:user) { User.new(0) }
      let(:another_user) { User.new(1) }
      let(:article) { Article.new(another_user) }

      must { permit :create, :show }
    end

    describe 'Article Creater' do
      let(:user) { User.new(1) }

      must { permit :create, :show, :update }
    end

  end
end

describe Shoulda::Matchers::Pundit::ForbidMatcher do

  describe ArticlePolicy do

    subject { ArticlePolicy.new(user, article) }
    let(:article) { Article.new(user) }

    describe 'Guest' do
      let(:user) { nil }

      must { forbid :create, :update, :destroy }
    end

    describe 'Any User' do
      let(:user) { User.new(0) }
      let(:another_user) { User.new(1) }
      let(:article) { Article.new(another_user) }

      must { forbid :update, :destroy }
    end

    describe 'Article Creater' do
      let(:user) { User.new(1) }

      must { forbid :destroy }
    end

  end
end

describe Shoulda::Matchers::Pundit::PermittedToMatcher do

  let(:article) { Article.new(subject) }

  describe 'Guest' do
    subject { nil }

    describe ArticlePolicy do

      wont { be_permitted_to(:create).on(article) }
      must { be_permitted_to(:show).on(article) }
      wont { be_permitted_to(:update).on(article) }
      wont { be_permitted_to(:destroy).on(article) }

    end
  end


  describe 'Any User' do
    subject { User.new(0) }

    describe ArticlePolicy do
      let(:another_user) { User.new(1) }
      let(:article) { Article.new(another_user) }

      must { be_permitted_to(:create).on(article) }
      must { be_permitted_to(:show).on(article) }
      wont { be_permitted_to(:update).on(article) }
      wont { be_permitted_to(:destroy).on(article) }

    end

  end

  describe 'Article Creator' do
    subject { User.new(1) }

    describe ArticlePolicy do

      must { be_permitted_to(:create).on(article) }
      must { be_permitted_to(:show).on(article) }
      must { be_permitted_to(:update).on(article) }
      wont { be_permitted_to(:destroy).on(article) }

    end

  end
end
