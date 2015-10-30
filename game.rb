require './player'
require 'colorize'
require 'pry'

def game_init

  puts("Enter name for player 1:")
  name = gets.chomp
  @player1 = Player.new(name)

  puts("Enter name for player 2:")
  name = gets.chomp
  @player2 = Player.new(name)

  @player1_is_active = true
  #binding.pry
end

def next_question
  #updates question, a two element array containing a question string
  #and its answer
  @question = []
  num1  = rand(1..20)
  num2  = rand(1..20)
  index = rand(0..4)

  operators = ['+', '-', '/', '*', '%']

  @question[0] = num1.to_s + ' ' + operators[index] + ' ' + num2.to_s + ' ='
  @question[1] = num1.send operators[index], num2
  
end

def ask(player)
  puts "OK, #{player.name}, what is " + @question[0]
end

def update(answer)
  if answer == @question[1].to_s
    @player1_is_active ? @player1.right : @player2.right
    puts "Yup".green
  else
    @player1_is_active ? @player1.wrong : @player2.wrong
    puts "Nope, correct answer is #{@question[1]}".red
    puts "#{@player1.name}, you have #{@player1.points} points and #{@player1.lives} lives left"
    puts "#{@player2.name}, you have #{@player2.points} points and #{@player2.lives} lives left"
  end
end

def winner(player)
  puts "Congratulations #{player.name}, you won this game".green
  puts "So far, you've answered #{player.points} questions correctly"
end

def loser(player)
  puts "Too bad #{player.name}, you lost. Better luck next time".red
  puts "But at least you've answered #{player.points} questions correctly so far"
end

def game_summary
  @player1.is_alive? ? winner(@player1) : loser(@player1)
  @player2.is_alive? ? winner(@player2) : loser(@player2)
end


play_again = 'yes'

game_init
while(play_again == 'yes')
  @player1.reset_lives
  @player2.reset_lives
  
  while(@player1.is_alive? && @player2.is_alive?)
    next_question
    @player1_is_active ? ask(@player1) : ask(@player2)
    answer = gets.chomp
    update(answer)
    @player1_is_active = !@player1_is_active
  end

  game_summary
  puts "Play again? ('yes' or 'no')"
  play_again = gets.chomp.downcase
end




