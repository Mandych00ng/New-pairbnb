class UsersController < Clearance::UsersController
before_action :find_user, only: [:edit, :show, :update]

def show
    @u = User.find(params[:id])
    @i = @u.profile_pic
    @a = @u.username
    @e = @u.email

end

def edit
    @user = User.find(params[:id])
end


 def create
   @user = user_from_params

   if @user.save
     sign_in @user
     redirect_back_or url_after_create
   else
     render template: "users/new"
   end
 end

 def update
     if @user.update(user_params)
         redirect_to user_path
     else
         flsah[:message] = 'Fail to update ur profile'
         render :edit
     end
 end

private
 def user_from_params

   email = user_params.delete(:email)
   password = user_params.delete(:password)
   profile_pic = user_params.delete(:profile_pic)
   username = user_params.delete(:username)

   Clearance.configuration.user_model.new(user_params).tap do |user|
     user.email = email
     user.password = password
     user.profile_pic = profile_pic
     user.username = username
   end
 end

    def user_params
        params.require(:user).permit(:email, :password, :profile_pic, :username)
    end

    def find_user
        @user = User.find(params[:id])
    end

end