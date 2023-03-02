class ApplicationController < ActionController::Base

  def index

    matching_users = User.all

    @list_of_users = matching_users.order({ :created_at => :desc })

    render({ :template => "users/index.html.erb" })

  end

  def show
    the_id = params.fetch("user_path")

    matching_user = User.where({ :username => the_id })

    @the_user = matching_user.at(0)

    @user_photos = Photo.where(:owner_id => @the_user.id)

    render({ :template => "users/show.html.erb" })
  end

  def show_feed
    the_id = params.fetch("user_path")

    matching_user = User.where({ :username => the_id })

    @the_user = matching_user.at(0)

    @the_feed

    render({ :template => "users/show_feed.html.erb" })
  end

  def show_discover
    the_id = params.fetch("user_path")

    matching_user = User.where({ :username => the_id })

    @the_user = matching_user.at(0)

    @user_photos = Photo.where(:owner_id => @the_user.id)

    render({ :template => "users/show.html.erb" })
  end

  def show_liked_photos
    the_id = params.fetch("user_path")

    matching_user = User.where({ :username => the_id })

    @the_user = matching_user.at(0)

    @user_photos = Photo.where(:owner_id => @the_user.id)

    render({ :template => "users/show.html.erb" })
  end




  before_action(:load_current_user)
  
  # Uncomment line 5 in this file and line 3 in UserAuthenticationController if you want to force users to sign in before any other actions.
  # before_action(:force_user_sign_in)
  
  def load_current_user
    the_id = session[:user_id]
    
    @current_user = User.where({ :id => the_id }).first
  end
  
  def force_user_sign_in
    if @current_user == nil
      redirect_to("/user_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
