require 'pry'

class FakeEmailProvider
  def initialize subjects
    @subjects = subjects
  end

  def get_subjects
    @subjects
  end
end

class WordChecker
  def initialize subject_provider
    @subject_provider = subject_provider
  end

  def check words
    provider_subjects = @subject_provider.get_subjects
    
    words.reduce(true) do |result, word|
      result && provider_subjects.any? { |subject| subject.include?(word) }
    end
  end
end