class PostsController < ApplicationController


  # I set a callback to be executed before each actions that needs it (show only in this case)
  # before_action :set_patient, only: [:transfer]
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # ********************************************************************************************************************
  # *                                           *** C R E A T E ***                                                    *
  # ********************************************************************************************************************

  # Shows the new view, with the form used by the user to enter the info of the Post
  def new
    # Creates a Post, so we can also use here the partial _form, that is expecting a @post (used in edition)
    @post = Post.new
  end

  # Stores in the DB the Post
  def create
    # Temporal. Just to see if it receives the Post
    # render plain: params[:post].inspect

    # It creates a variable with the data received in the method post_params
    @post = Post.new post_params

    # It saves the Post in the DB
    @post.save

    # Redirects to the index view
    # redirect_to posts_path
    # Redirects to the show view (just for now)
    redirect_to @post
  end


  # ********************************************************************************************************************
  # *                                           *** R E N D E R ***                                                    *
  # ********************************************************************************************************************

  # Shows the index view and sends there all the Posts in the DB, to be shown there
  def index
    # This stores in a variable all the Posts that exists in the DB
    @posts = Post.all

    # Redirects to the index view
    # redirect_to posts_path
  end

  # Shows the show view and also sends there the already located Post (in the callback set_post), to be shown there
  def show
  end


  # ********************************************************************************************************************
  # *                                           *** U P D A T E ***                                                    *
  # ********************************************************************************************************************

  # Shows the edit view with the edition form and sends there the data of the already located Post
  def edit
  end

  # Updates a Post in the DB, by receiving the id from the edition form in the edit view
  def update
    # Updates the info of the located Post with the new info received in the method post_params
    @post.update post_params

    # Redirects to the index view
    redirect_to posts_path
    # Redirects to the show view (just for now)
    # redirect_to @post
  end


  # ********************************************************************************************************************
  # *                                           *** D E L E T E ***                                                    *
  # ********************************************************************************************************************\

  # Deletes a Post in the DB
  def destroy
    # Deletes the located Post in the DB
    @post.destroy

    # Redirects to the index view
    redirect_to posts_path
    # Redirects to the show view (just for now)
    # redirect_to @post
  end


  private

  # A protection mechanism. This specify the necessary params of the Post (strong params).
  def post_params
    params.require(:post).permit(:subject)
  end

  # Implementation of the Callback set_post, to be executed  before each actions that needs it
  def set_post
    # It locates the Post in the DB by using the post_id that it is receiving
    @post = Post.find params[:id]
  end


end
