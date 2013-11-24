require 'active_record'
require 'active_record/fixtures'

# Packaged version of https://github.com/rails/rails/pull/13022
unless defined?(ActiveRecord::FixtureSet::RenderContext)
  module ActiveRecord
    class FixtureSet
      # The context used by the ERB fixture renderer.
      #
      # Make helper functions available in your fixtures by defining them in a
      # module and including it in ActiveRecord::FixtureSet::RenderContext.
      #
      # A new subclass of this class is created each time the ERB renderer is
      # called so that methods defined in ERB templates do not leak into other
      # templates' context.
      class RenderContext
        # An instance of a new RenderContext subclass.
        def self.create
          klass = ::Class.new(ActiveRecord::FixtureSet::RenderContext) do
            def get_binding
              binding()
            end
          end

          klass.new
        end
      end
    end
  end

  module ActiveRecord
    class FixtureSet
      class File
        def render(content)
          context = ActiveRecord::FixtureSet::RenderContext.create
          ERB.new(content).result(context.get_binding)
        end
      end
    end
  end
end  # !defined?(ActiveRecord::FixtureSet::RenderContext)
