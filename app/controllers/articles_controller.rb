class ArticlesController < ApplicationController
  
 
  def new
    p "ArticlesController new"
    puts session[:user_id]
  end


  def index
    user = @user=User.find(current_user)
    @articles = current_user.articles.paginate(:page => params[:page])

    p "ArticlesController index user_id" + @user.id.to_s
    myfriends = Friendship.where(friendA: @user.id )
    myfriends = myfriends.concat( Friendship.where(friendB: @user.id ) )
    @friends = []
    myfriends.each do |f|

      if f.status.to_s != "4"  # not blocked
        if (f.friendA.to_s == @user.id.to_s)
          u = User.find(f.friendB) 
        else
          u = User.find(f.friendA)
        end
        @friends.push(u)
      end
      if u
      ua = u.articles.paginate(:page => params[:page])
      
      @articles=@articles.concat( ua )
      end
    end

    #@articles = @articles.contact()
    #puts "!! ArticlesController index"+ current_user.articles.length.to_s + " " + @articles.empty?.to_s
  end
  
  def show
    @article = Article.find(params[:id])
    #render nothing: true
    render 
  end
  
  def edit
    p "! articlesController edit"
    @article = Article.find(params[:id])
    #render nothing: true
    render 
  end
  

  def update
    p "!! articlesController update"

    @article = Article.find(params[:id])
    @article.user_id= current_user.id
    @article.update_attributes(params[:article])
    
    redirect_to  :action => 'index'
    #render nothing: true
  
  end
  

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to  :action => 'index'
  end

  def new_article
    params.require(:article).permit(:text, :title , :user_id )
  end

 def create
  #params[:article]
  #params[:article][:user] = Integer(params[:article][:user])

  @article = Article.new(new_article)
  @article.user_id= current_user.id
  @article.save
  redirect_to  :action => 'index'
 end
   
end
