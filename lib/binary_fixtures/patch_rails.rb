require 'active_record'
require 'active_record/fixtures'

class ActiveRecord::FixtureSet::RenderContext
  include BinaryFixtures::FixtureHelpers
end
