class PostsController < ApplicationController
      before_action :authenticate_user
      before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
        
  def index
    @posts = Post.all.order(date: :desc).where(menu: "ベンチプレス")
    myselfid = User.find_by(name:@current_user.name)
    gon.myselfp = Post.order('date desc').where(user_id: myselfid.id,menu: "ベンチプレス")
    gon.myselfu = User.find_by(name: myselfid.name)
    friend1id = User.find_by(name:@current_user.friend_1)
    gon.friend1p = Post.order('date desc').where(user_id: friend1id.id,menu: "ベンチプレス")
    gon.friend1u = User.find_by(name: friend1id.name)
    friend2id = User.find_by(name:@current_user.friend_2)
    gon.friend2p = Post.order('date desc').where(user_id: friend2id.id,menu: "ベンチプレス")
    gon.friend2u = User.find_by(name: friend2id.name)
  end
  
  def index2
    @posts = Post.all.order(date: :desc).where(menu: "デッドリフト")
    myselfid = User.find_by(name:@current_user.name)
    gon.myselfp = Post.order('date desc').where(user_id: myselfid.id,menu: "デッドリフト")
    gon.myselfu = User.find_by(name: myselfid.name)
    friend1id = User.find_by(name:@current_user.friend_1)
    gon.friend1p = Post.order('date desc').where(user_id: friend1id.id,menu: "デッドリフト")
    gon.friend1u = User.find_by(name: friend1id.name)
    friend2id = User.find_by(name:@current_user.friend_2)
    gon.friend2p = Post.order('date desc').where(user_id: friend2id.id,menu: "デッドリフト")
    gon.friend2u = User.find_by(name: friend2id.name)
  end
  def index3
    @posts = Post.all.order(date: :desc).where(menu: "スクワット")
    myselfid = User.find_by(name:@current_user.name)
    gon.myselfp = Post.order('date desc').where(user_id: myselfid.id,menu: "スクワット")
    gon.myselfu = User.find_by(name: myselfid.name)
    friend1id = User.find_by(name:@current_user.friend_1)
    gon.friend1p = Post.order('date desc').where(user_id: friend1id.id,menu: "スクワット")
    gon.friend1u = User.find_by(name: friend1id.name)
    friend2id = User.find_by(name:@current_user.friend_2)
    gon.friend2p = Post.order('date desc').where(user_id: friend2id.id,menu: "スクワット")
    gon.friend2u = User.find_by(name: friend2id.name)
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    # @user = params[:id]
    @user = @post.user
    gon.data1 = Post.where(user_id: @user.id)
  end
  
  def new
    @post = Post.new
  end
  
   def create
    @post = Post.new(
      kg: params[:kg],
      rep: params[:rep],
      kg2: params[:kg2],
      rep2: params[:rep2],
      kg3: params[:kg3],
      rep3: params[:rep3],
      date: params[:date],
      menu: params[:menu],
      user_id: @current_user.id
      )
      if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
      else
      render("posts/new")
      end
   end
  
  def edit
    @post = Post.find_by(id: params[:id])
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    @post.kg = params[:kg]
    @post.rep = params[:rep]
    @post.kg2 = params[:kg2]
    @post.rep2 = params[:rep2]
    @post.kg3 = params[:kg3]
    @post.rep3 = params[:rep3]
    @post.date = params[:date]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/posts/index")
  end
  
  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @current_user.id != @post.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/posts/index")
    end
  end
  
 
end
