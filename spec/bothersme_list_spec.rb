# encoding: utf-8
require 'spec_helper'

class TestRails
  attr_accessor :env
end

class String
  def html_safe
    self
  end
end

if Object.const_defined?(:Rails)
  OldRails = Rails
  Object.send(:remove_const, :Rails)
end
Rails = TestRails.new

describe BothersmeList do
  let(:test_instance) { (Class.new { include BothersmeList }).new }

  describe ".issues_list" do
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

    it "should include correct URL prefix" do
      Rails.env = 'test'
      expect(test_instance.issues_list("a", "b")).to include('//dev.' + BothersmeList::BASE_DOMAIN + '/bm_track_issue/bm_track_issue')
    end
  end

  describe ".detect_bothers_server_name" do
    it "by default return dev server" do
      Object.send(:remove_const, :Rails)
      expect(test_instance.detect_bothers_server_name()).to eq(BothersmeList::DEFAULT_NO_ENV_PREFIX + BothersmeList::BASE_DOMAIN)
      Rails = TestRails.new
    end

    describe "with Rails defined" do
      it "by default return test server" do
        Rails.env = nil
        expect(test_instance.detect_bothers_server_name()).to eq(BothersmeList::DEFAULT_ENV_PREFIX + BothersmeList::BASE_DOMAIN)
      end

      it "if staging return test" do
        Rails.env = 'staging'
        expect(test_instance.detect_bothers_server_name()).to eq('test.' + BothersmeList::BASE_DOMAIN)
      end

      it "if development return dev" do
        Rails.env = 'development'
        expect(test_instance.detect_bothers_server_name()).to eq('dev.' + BothersmeList::BASE_DOMAIN)
      end

      it "if test return tev" do
        Rails.env = 'test'
        expect(test_instance.detect_bothers_server_name()).to eq('dev.' + BothersmeList::BASE_DOMAIN)
      end

      it "if production return empty" do
        Rails.env = 'production'
        expect(test_instance.detect_bothers_server_name()).to eq(BothersmeList::BASE_DOMAIN)
      end

      it "if something else return test" do
        Rails.env = 'somethingelse'
        expect(test_instance.detect_bothers_server_name()).to eq('test.' + BothersmeList::BASE_DOMAIN)
      end
    end
  end
end

if Object.const_defined?(:OldRails)
  Object.send(:remove_const, :Rails)
  Rails = OldRails
end
