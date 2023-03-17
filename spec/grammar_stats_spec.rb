require 'grammar_stats'

RSpec.describe GrammarStats do 
  grammar_stats = GrammarStats.new
  it "should return true if text starts with capital letter" do
    expect(grammar_stats.check("Hello!")).to eq true
  end

  it "should return false if text does not starts with capital letter" do
    expect(grammar_stats.check("welcome")).to eq false

  end

  it "should return false if text does not starts with capital letter and 
  ends with ponctuation " do
    expect(grammar_stats.check("good morning!")).to eq false
  end

  it "should return true if text starts with capital letter and 
  ends with ponctuation " do
    expect(grammar_stats.check("Good morning!")).to eq true
  end
end

RSpec.describe GrammarStats do 
  it "should return 67% when 2 out 3 passed" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Good morning!")
    grammar_stats.check("good afternoon!")
    grammar_stats.check("Good evening!")
    expect(grammar_stats.percentage_good).to eq 67
  end

  it "should return 33% when 1 out 3 passed" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Good morning!")
    grammar_stats.check("good afternoon!")
    grammar_stats.check("Good evening")
    expect(grammar_stats.percentage_good).to eq 33
  end

  it "should return 0 when none of them passed" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("good morning!")
    grammar_stats.check("good afternoon!")
    grammar_stats.check("Good evening")
    expect(grammar_stats.percentage_good).to eq 0
  end

  it "should return 0 when no check is called" do
    grammar_stats = GrammarStats.new
    expect(grammar_stats.percentage_good).to eq 0
  end

  it "should 100% when all tests passed" do
    grammar_stats = GrammarStats.new
    grammar_stats.check("Welcome!")
    expect(grammar_stats.percentage_good).to eq 100
  end 
end


