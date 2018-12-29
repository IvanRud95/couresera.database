
class LineAnalyzer

  attr_accessor :highest_wf_count, :highest_wf_words, :content, :line_number


  def initialize (content, line_number) 
    self.highest_wf_words = Array.new
    self.content = content
    self.line_number = line_number
    calculate_word_frequency
  end

  def calculate_word_frequency
    word_frequency = Hash.new(0)
    self.content.split.each do |word|
      word_frequency[word.downcase] += 1
    end
    self.highest_wf_count = word_frequency.values.max
    self.highest_wf_words = word_frequency.select { |k, v| v == highest_wf_count }.keys
  end
end

#  Implement a class called Solution. 
class Solution
  include Enumerable

  attr_accessor :highest_count_across_lines, :highest_count_words_across_lines, :analyzers

  def initialize
    self.analyzers = Array.new
  end
  
 
  def analyze_file
    begin
      File.foreach('test.txt') do |line|
        self.analyzers << LineAnalyzer.new(line.chomp, $.)
      end
    rescue Exception => e
      puts e.message
    end
  end
  def calculate_line_with_highest_frequency # FUNCIONANDO \o/
    self.highest_count_words_across_lines = Array.new
    self.analyzers.max_by do |item|
      self.highest_count_across_lines = item.highest_wf_count
    end
    self.highest_count_words_across_lines += self.analyzers.select { |item| item.highest_wf_count == self.highest_count_across_lines }
  end
  

  def print_highest_word_frequency_across_lines
    self.analyzers.each do |array_item|
      puts "#{array_item.highest_wf_words} (appears in line #{array_item.line_number})" if self.highest_count_across_lines == array_item.highest_wf_count
    end
  end
end

