class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]


  def index
    @emplyees = Emplyee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to employees_path
    else
      render 'new', notice: "Employee save was not successful."
    end
  end

  def show

  end

  def edit

  end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit', notice: "Employee save was not successful."
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path, notice: "Employee successfully deleted"
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :login_name, :password)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
