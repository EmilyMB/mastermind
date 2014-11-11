class Guess

  attr_reader :correct_color_count, :correct_color_placement

  def initialize(answer, solution)
    @guess = answer
    @guess_array = @guess.split('').to_a
    @solution = solution.split('').to_a
    @correct_color_count = 0
    @correct_color_placement = 0
  end

  def valid?
    @guess_array.all? { |letter| ['b', 'g' ,'r', 'y'].include? letter }
  end

  def correct_colors
    guess_hash = Hash.new(0)
    @guess_array.each{ |letter| guess_hash[letter] += 1 }
    solution_hash = Hash.new(0)
    @solution.each{ |letter| solution_hash[letter] += 1 }
    solution_hash.each  do |color, count|
        @correct_color_count += [guess_hash[color], solution_hash[color]].min
    end
  end

  def correct_placement
    together = @guess_array.zip(@solution)
    together.each { |x| @correct_color_placement += 1 if x[0] == x[1] }
  end


end
