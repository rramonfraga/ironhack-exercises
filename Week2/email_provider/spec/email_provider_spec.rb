require 'rspec'
require_relative '../email_provider.rb'

RSpec.describe "Word checker" do 
  describe "FakeEmailProvider has no strings" do
    let(:provider) { instance_double("FakeEmailProvider", :get_subjects => []) }

    it "should return true if no words is given" do
      counter = WordChecker.new(provider)
      expect(counter.check([])).to eq(true)
    end

    it "should return false if a word is included in the subject" do
      counter = WordChecker.new(provider)
      expect(counter.check(["hola"])).to be(false)
    end
  end

  describe "FakeEmailProvider has strings" do
    let(:provider) { instance_double("FakeEmailProvider", :get_subjects => ["hola", "adios", "subject2", "esto es un subject de email"]) }

    it "should return true if a word is included in the subject" do
      counter = WordChecker.new(provider)
      expect(counter.check(["hola"])).to be(true)
    end

    it "should return true if some words are included in the subject" do
      counter = WordChecker.new(provider)
      expect(counter.check(["hola", "adios", "un"])).to be(true)
    end
  end
end