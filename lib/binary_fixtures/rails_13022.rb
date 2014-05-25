require 'active_record'
require 'active_record/fixtures'

# Packaged version of https://github.com/rails/rails/pull/13022
unless ActiveRecord::FixtureSet.respond_to?(:context_class)
  class ActiveRecord::FixtureSet # :nodoc:
    # Superclass for the evaluation contexts used by ERB fixtures.
    def self.context_class
      @context_class ||= Class.new
    end

    class File
      def render(content)
         context = ActiveRecord::FixtureSet::RenderContext.create_subclass.new
         ERB.new(content).result(context.get_binding)
      end
    end
  end

  class ActiveRecord::FixtureSet::RenderContext # :nodoc:
    def self.create_subclass
      Class.new ActiveRecord::FixtureSet.context_class do
        def get_binding
          binding()
        end
      end
    end
  end
end  # !defined?(ActiveRecord::FixtureSet::RenderContext)
