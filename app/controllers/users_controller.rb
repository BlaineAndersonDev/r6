class UsersController < ApplicationController
  def index
    @users = User.all
    @user = User.new
  end

  def create
    @user = User.new(name: params['user']['name'])
   
    respond_to do |format|
      if @user.save
        puts ">>> User Saved"
        format.js
      else
        puts ">>> User Did Not Save"
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def user_params
      params.require(:user).permit(:name)
    end

end
