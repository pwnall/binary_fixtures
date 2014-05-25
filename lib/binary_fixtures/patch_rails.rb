require 'active_record'
require 'active_record/fixtures'

ActiveRecord::FixtureSet.context_class.send :include,
                                            BinaryFixtures::FixtureHelpers
