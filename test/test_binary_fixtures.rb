require File.expand_path('../helper', __FILE__)

class BinaryFixturesTest < ActiveSupport::TestCase
  def setup
    @ruby = attachments(:ruby)
    @ruby_path = 'test/fixtures/files/ruby.png'

    @invoice = attachments(:invoice)
    @invoice_path = 'test/fixtures/files/invoice.pdf'
  end

  test 'ruby metadata was set up correctly' do
    assert_equal 'ruby.png', @ruby.name
    assert_equal 'image/png', @ruby.mime_type
    assert_equal File.stat(@ruby_path).size, @ruby.size
  end

  test 'ruby binary data was set up correctly' do
    assert_equal Encoding::BINARY, @ruby.data.encoding
    assert_equal File.stat(@ruby_path).size, @ruby.data.length
    assert_equal File.binread(@ruby_path), @ruby.data
  end

  test 'invoice metadata was set up correctly' do
    assert_equal 'invoice.pdf', @invoice.name
    assert_equal 'application/pdf', @invoice.mime_type
    assert_equal File.stat(@invoice_path).size, @invoice.size
  end

  test 'invoice binary data was set up correctly' do
    assert_equal Encoding::BINARY, @invoice.data.encoding
    assert_equal File.stat(@invoice_path).size, @invoice.data.length
    assert_equal File.binread(@invoice_path), @invoice.data
  end
end
