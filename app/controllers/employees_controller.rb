class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update]
  def index
    @employees = Employee.all
  end

  def show
  end

  def new
    @dogs = Dog.all
    if !!flash[:data]
      @employee = Employee.new(flash[:data])
    else
      @employee = Employee.new
    end
  end

  def create
    @employee = Employee.create(employee_params)

    if @employee.valid?
      #IS THIS STRONG? HOW CAN WE MAKE IT STROGNG
      EmployeeDog.create(dog_id:params[:employee][:id], employee_id:@employee.id)
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      flash[:data] = employee_params
      redirect_to new_employee_path
    end
  end

  def edit
    @dogs = Dog.all
  end

  def update
    @employee.update(employee_params)

    if @employee.valid?
      #IS THIS STRONG? HOW CAN WE MAKE IT STROGNG
      @ed = EmployeeDog.find(params[:id])
      @ed.update(dog_id:params[:employee][:id])
      redirect_to employee_path(@employee)
    else
      flash[:errors] = @employee.errors.full_messages
      flash[:data] = employee_params
      redirect_to edit_employee_path
    end
  end

  private
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url)
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
