# encoding: utf-8
require 'spec_helper'

describe BothersmeList do
  describe ".issues_list" do
    let(:test_instance) { (Class.new { include BothersmeList }).new }

    it "should include type" do
      expect(test_instance.issues_list("zzzz", "a", "b")).to include("zzzz")
    end
    it "should include company" do
      expect(test_instance.issues_list("a", "zzzz", "b")).to include("zzzz")
    end
    it "should include product" do
      expect(test_instance.issues_list("a", "b", "zzzz")).to include("zzzz")
    end
    it "should include script tag unencoded" do
      expect(test_instance.issues_list("a", "b")).to include("</script>")
    end
  end
end
