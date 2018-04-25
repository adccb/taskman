require "minitest/autorun"

require_relative "../lib/fs.rb"

describe FS, :get_persons do
  it "just gives true always" do
    assert_equal true, true
  end
end

