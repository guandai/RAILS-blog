module FriendshipsHelper

 def  changeText(session, user, relations )
 	#p "FriendshipsHelper changeText"
 	
 	  @a = session[:user_id]
	  @b =  user.id 
	  curFriendship = { id: 0 , friendA: 0, friendB: 0, status: 0, accepted: false  }
	  relations.each do |f|

	    if f[:friendA].to_s == user.id.to_s || f[:friendB].to_s == user.id.to_s 
	        curFriendship = f
	      break
	    end
	  end
	 
	  case curFriendship[:status].to_s
	    when "0"
	      @makebtn = "Make friendship"
	      @delbtn = "Breake relation"
	      @blkbtn = "Block this person"

	      @makedis = false
	      @deldis = true
	      @blkdis = true
	    when "1"
	      @makebtn = "Waiting for accept"
	      @delbtn = "Remove apply"
	      @blkbtn = "Block this person"
			
	      @makedis = true
	      @deldis = false
	      @blkdis = false
	    when "2"
	      @makebtn = "you are friends"
	      @delbtn = "Break relation"
	      @blkbtn = "Block this person"

	      @makedis = true
	      @deldis = false
	      @blkdis = false
	    when "4"
	      @makebtn = "This person blocked"
	      @delbtn = "Break relation"
	      @blkbtn = "Block this person"

	      @makedis = true
	      @deldis = false
	      @blkdis = true
	    else
	      @makebtn = "Make friendship"
	      @delbtn = "Break relation"
	      @blkbtn = "Block this person"

	      @makedis = false
	      @deldis = false
	      @blkdis = false
	    end  
		
		if curFriendship[:friendA].to_s != @a.to_s  && curFriendship[:status]==1
      	  @makebtn = "Accept invitation"
      	  @makedis = false
      	  @deldis = true
      	end
 end


end
