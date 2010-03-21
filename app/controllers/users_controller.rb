class UsersController < Clearance::UsersController 
  def check_avaliability
    result = User.find_by_email(params[:user_email]).nil?
    respond_to do |format|
      format.json { render :json => {:result => result}.to_json } 
    end
  end
end
