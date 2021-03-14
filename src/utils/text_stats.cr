class TextStats
  def initialize(@text : String)
  end

  def word_count : UInt32
    count = 0_u32
    @text.scan(/[^\s]+/) do |_word|
      count += 1
    end
    count
  end
end
