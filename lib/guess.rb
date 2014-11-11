require_relative 'game'
require_relative 'printer'


class Guess

  attr_reader :correct_color_count, :correct_color_placement, :correct_colors

  def initialize(answer, solution)
    @guess = answer
    @guess_array = @guess.split('').to_a
    @solution = solution.split('').to_a#['b', 'b', 'b', 'b']
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
      if guess_hash[color] <= solution_hash[color]
        @correct_color_count += guess_hash[color]
      else
        @correct_color_count += solution_hash[color]

        #@correct_color_count += min(solution_hash[color], guess_hash[color])
      end
    end
  end

  def correct_placement
    printer = Printer.new
    together = []
    together = @guess_array.zip(@solution)
    together.each { |x| @correct_color_placement += 1 if x[0] == x[1] }
    printer.correct_place(@guess.upcase, @correct_color_count, @correct_color_placement)
  end


end
