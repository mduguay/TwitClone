class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def new
		@user = User.new()
	end

	def create
		@user = User.new(user_params)
		if @user.save
			sign_in @user
			flash[:success] = "Congrats on signing up!"
			redirect_to @user #why the hell does this work?
		else
			render 'new' #add flash with fail tokens? Don't need to. Rails puts erros in User object.
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update_attributes(user_params)
			flash[:success] = "Profile Updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	private 
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
