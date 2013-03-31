require "shoulda/matchers/pundit/version"

module Shoulda
  module Matchers
    module Pundit

      def permit(*actions)
        PermitMatcher.new(*actions)
      end

      def forbid(*actions)
        ForbidMatcher.new(*actions)
      end

      def be_permitted_to(action)
        PermittedToMatcher.new(action)
      end

      class PermitMatcher
        attr_reader :actions, :policy
        attr_reader :failed_actions

        def initialize(*actions)
          @actions = actions
        end

        def matches?(policy)
          @policy = policy

          actions.inject(true) do |pass, action|
            pass = pass && match(action)
          end
        end

        def failure_message_for_should
          <<-message
            #{policy.class} does not #{failure_keyword_permit} #{failed_actions.join('/')} on #{policy.record}
            for #{policy.user.inspect}.
          message
        end

        def failure_message_for_should_not
          <<-message
            #{policy.class} does not #{failure_keyword_forbid} #{failed_actions.join('/')} on #{policy.record}
            for #{policy.user.inspect}.
          message
        end

        def description
          "permits #{@action}"
        end

        private

        def match(action)
          p = permits? action
          append_failed(action) unless p
          p
        end

        def permits?(action)
          policy.public_send("#{action}?")
        end

        def append_failed(action)
          @failed_actions << action
        end

        def failure_keyword_permit; 'permit'; end
        def failure_keyword_forbid; 'forbid'; end

      end

      class ForbidMatcher < PermitMatcher

        private

        def match(action)
          f = forbids? action
          append_failed(action) unless f
          f
        end

        def forbids?(action)
          !permits? action
        end

        def failure_keyword_permit; 'forbid'; end
        def failure_keyword_forbid; 'permit'; end

      end

      class PermittedToMatcher
        attr_reader :action, :record, :policy

        def initialize(action)
          @action = action
        end

        def matches?(user)
          @policy ||= infer_policy(user)
          @policy = policy.call(user, record) if @policy.is_a? Proc
          policy.public_send("#{action}?")
        end

        def on(record)
          @record = record
          self
        end

        #alias_method :on_a, :on
        #alias_method :a, :on
        #alias_method :to, :on

        def by(policy)
          @policy = case policy
            when Class then lambda { |user, record| policy.new(user, record) }
            else policy
          end
          self
        end

        def failure_message_for_should
          <<-message
            User is not permitted to #{action} a #{policy.record} by #{policy.class}.
            #{policy.user.inspect}.
          message
        end

        def failure_message_for_should_not
          <<-message
            User is not forbidden to #{action} a #{policy.record} by #{policy.class}.
            #{policy.user.inspect}.
          message
        end

        def description
          "permits #{action} on #{record}"
        end

        private

        def infer_policy(user)
          "#{record.class.name}Policy".constantize.new(user, record)
        end
      end
    end
  end
end
