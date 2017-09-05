class SessionsController < ApplicationController
  def new
  end

  def create
    @employee = Employee.find_by_login_name(params[:employee][:login_name])


    if @employee && @employee.authenticate(params[:employee][:password])
      session[:current_user_id] = @employee.id
      session[:current_username] = "#{@employee.first_name} #{@employee.last_name}"
      redirect_to products_path, notice: "Signed in as #{session[:current_username]}"
    else
      redirect_to login_path, notice: "Employee not found."
    end
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
