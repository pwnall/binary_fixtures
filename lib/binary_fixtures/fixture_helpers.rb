require 'base64'

require 'rails'

module BinaryFixtures::FixtureHelpers
  # The contents of a binary file, in a YAML-friendly format.
  #
  # @param [String] path the path of the binary file to be included, relative
  #   to the Rails application's test/fixtures directory
  # @param [Hash] options optionally specify the current indent level
  # @option options [Integer] indent the number of spaces that the current line
  #   in the YAML fixture file is indented by
  # @return [String] base64-encoded binary file contents
  def binary_file(path, options = {})
    # The line with base64 data must be indented further than the current line.
    indent = ' ' * ((options[:indent] || 2) + 2)

    file_path = Rails.root.join('test/fixtures').join(path)
    binary_data = File.binread file_path
    base64_data = Base64.encode64 binary_data
    base64_data.gsub! "\n", "\n#{indent}"
    base64_data.strip!

    "!!binary |\n#{indent}#{base64_data}"
  end
end  # module BinaryFixtures::FixtureHelpers
