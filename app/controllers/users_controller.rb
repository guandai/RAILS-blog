class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def new_person
    params.require(:user).permit(:first_name, :last_name, :email, :name, :password_digest )
  end

  def create
    p ">>>>>> create"
    @user = User.new(new_person)

    respond_to do |format|
      if @user.save
        p ">>>>>> user created"
        format.html { redirect_to  "/login", notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        p ">>>>>> user created fail"
        p @user.errors
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(new_person)
        p "updated!"
        format.html { redirect_to "/login", notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        p "updated fail!"
        p @user.update_attributes(new_person)
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
