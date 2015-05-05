class FriendshipsController < ApplicationController
  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @friendships }
    end
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @friendship = Friendship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @friendship }
    end
  end

  # GET /friendships/new
  # GET /friendships/new.json
  def new
    @relations=[]
    @a = session[:user_id].to_i
    #p "FriendshipsController new @a:" + @a.to_s
    if Friendship.where(friendA:  @a)[0]
      @relations=@relations.concat( Friendship.where(friendA:  @a))
    end

    if Friendship.where(friendB:  @a)[0]
      @relations=@relations.concat( Friendship.where(friendB:  @a))
    end
   # p @relations
    #@relations = @relations.concat()
    # sent to view
    

    #p "FriendshipsController new " + @relations.length.to_s
    # @relations.each do |a|
    #   p a
    # end

    @users = User.all
    #p "FriendshipsController @users length: " + @users.length.to_s

    @users.delete(current_user)  # remove myself
    #p "FriendshipsController @users length: " + @users.length.to_s 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @friendship }
    end
  end

  # GET /friendships/1/edit
  def edit
    @friendship = Friendship.find(params[:id])
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @a = session[:user_id].to_s
    @b = params[:id].to_s
    exist = 0
    
    Friendship.all.each do |f|
        if (f.friendA.to_s==@a.to_s  && f.friendB.to_s == @b.to_s) || (f.friendA.to_s==@b.to_s  && f.friendB.to_s==@a.to_s) 
            exist = 1
            if f.status==1
              f.update_attributes( :status => 2)
            end
            break
        end
    end

# create and correct friend ship
    
    if exist == 0  
      @friendship = Friendship.new()
      p "create a new friendship"
      @friendship.friendA=@a # FriendA is current user
      @friendship.friendB=@b # this is list friend ,  means FriendB
      @friendship.accepted = false
      @friendship.status = 1   
      p @friendship
      @friendship.save
      # 0 => no relation   , 1 waiting answer , 2 bidirection , 4 block  , 
    else

    end

     redirect_to :action => "new"
    
  end

  # def update
  #   @friendship = Friendship.find(params[:id])

  #   respond_to do |format|
  #     if @friendship.update_attributes(params[:friendship])
  #       format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @friendship.errors, status: :unprocessable_entity }
  #     end
  #   end

  # end
  
  def block
      
      @a = session[:user_id].to_s
      @b = params[:id].to_s

      @friendship = Friendship.where( friendA: @a , friendB: @b)[0] || Friendship.where( friendA: @b , friendB: @a)[0] 
      @friendship.update_attributes( :status => 4)
      
      respond_to do |format|
        format.html { redirect_to request.env["HTTP_REFERER"] }
        format.json { head :no_content }
      end     
  end


  def destroy
    @a = session[:user_id].to_s
    @b = params[:id].to_s

    @friendshipA = Friendship.where( friendA: @a , friendB: @b)[0] 
    @friendshipB = Friendship.where( friendA: @b , friendB: @a)[0] 
    
    
    if @friendshipA
      @friendshipA.destroy
    end 
    if @friendshipB
      @friendshipB.destroy
    end 
    

    respond_to do |format|
      format.html { redirect_to request.env["HTTP_REFERER"] }
      format.json { head :no_content }
    end
  end
end
