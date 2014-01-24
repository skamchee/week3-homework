class DiceController < ApplicationController

	def intro
		render "dice"
	end

	def roll_dice
		@diceURL = "https://uchicago.s3.amazonaws.com/d0"
		@sum = 0
		@dice = []
		2.times do |i|
			@dice[i] = rand(6) + 1
			@sum += @dice[i]
		end
	end

	def first_roll
		roll_dice

		params[:goal] = @sum

		if @sum == 7 || @sum == 11
			render "win"
		elsif @sum == 2 || @sum == 3 || @sum == 12
			render "lose"
		else
			render "roll"
		end
	end

	def subsequent_roll
		roll_dice

		if @sum == 7
			render "lose"
		elsif @sum == params[:goal]
			render "win"
		else
			render "roll"
		end
	end
end