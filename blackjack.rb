class Blackjack
	def initialize
		@total = 100
		#@player = Player.new
		@deck = Deck.new
		@hand = @deck.draw
		@dealer_hand = @deck.draw
		@hit = @deck.draw
		#@blackjack = play
	end

	def refresh
		@refresh = Deck.new
	end

	def play
		
		puts "Your cash total is #{@total}!"
		puts "-" * 70
		puts

		@total -= 10

		puts
		puts "You have payed 10 to play!"
		puts

		puts "Your new cash total is #{@total}!"
		puts

		if @hand.reduce(:+) == 21
			puts "Congrats you won this hand, cause you got BlackJack!"
			@total += 20
			play
		else
			choice
		end
	end

#add quit function

	def choice
		while @hand.reduce(:+) < 21 || @total <= 0
				puts "You have the cards #{@hand}! "
				puts
				puts "Would you like to hit, or stand?"
				player_choice = gets.chomp
				puts
			if player_choice == "hit"
					
					if @hand.reduce(:+) < 21

						@hand_total = []
						@hand.concat(@hand_total)
						(@hit).concat(@hand_total)
						@hand_total.concat(@hand)
						@refresh
						choice
						puts
					else
						puts "You busted, you lost this round! "
						@total -= 10
						@refresh
						choice
						puts
					end

			else player_choice == "stand"
					if @hand.reduce(:+) < @dealer_hand.reduce(:+)
						puts "You have won this hand!"
						@total += 20
						@refresh
						play
					
					elsif @hand.reduce(:+) > @dealer_hand.reduce(:+)
						puts "You have lost this hand!"
						@total -= 10
						@refresh
						play
						puts
						
					else @hand.reduce(:+) == @dealer_hand.reduce(:+)
						puts "You have tied, no one wins!"
						@total -= 10
						@refresh
						play
						puts
					end
			end		
		end
	end

class Player
	attr_accessor :hand , :dealer_hand
		def initialize
			@hand = []
		end

		def dealer_hand
			@dealer_hand = []
		end
end

class Deck
	attr_accessor :draw , :hit, :shuffle, :cards
		def initialize

			ace_cards = ([11] * 4)
			reg_cards = ([2..9] * 4)
			face_cards = ([10] * 16)
			@cards = ((2..9).to_a * 4).to_a.concat(ace_cards).concat(face_cards).shuffle

		end

		def total_cards
			@cards.count
		end

		def draw
			@cards.shift(2)
		end

		def hit
			@cards.shift(1)
		end
	end
end
puts "Welcome to the great game of Blackjack!"
puts "Let's get started!"

game_start = Blackjack.new
game_start.play
