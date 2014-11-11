class Code
  attr_reader :sequence

  def initialize
    @sequence = ""
    @possible_colors = ['r', 'g', 'b', 'y']
  end

  def create_code
    4.times do |color|
      @sequence += @possible_colors.sample
    end
    puts "this is the sequence #{@sequence}"
    @sequence
  end
end
