class SessionsController < ApplicationController
  def create
    # cherche s'il existe un utilisateur en base avec l’e-mail
    user = User.find_by(email: params["email"])
    puts "aaaaaaaaaaaaaaaaa #{user}"
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe 
    if (user && user.authenticate(params["password"]))
      flash[:success] = "tu es bien connecté #{user.first_name}"      
      session[:user_id] = user.id
      redirect_to("/")
      # redirige où tu veux, avec un flash ou pas
  
    else
      #redirect_to("/gossips")
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

def new
end

def destroy
  session.delete(:user_id)
  flash[:danger] = 'Vous êtes bien déconnectés'
  redirect_to ("/")
end

end
