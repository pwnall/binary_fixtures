# Mock Rails.root.
module Rails
  class <<self
    def root
      Pathname.new File.expand_path('../..', File.dirname(__FILE__))
    end
  end
end
