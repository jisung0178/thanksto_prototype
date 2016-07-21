class IdolsController < ApplicationController

	def index
		@idols = Idol.all
	end

end