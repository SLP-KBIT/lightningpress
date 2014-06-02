class Admin::MembersController < ApplicationController
  before_action :admin_filter
  before_action :get_member

  def index
    @members = Member.order(:student_number).all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    result = @member.save
    redirect_to admin_members_path and return if result
    render 'new' and return
  end

  def edit
  end

  def update
    result = @member.update(member_params)
    redirect_to admin_members_path and return if result
    render 'edit' and return
  end

  private

  def get_member
    @member = Member.id_is(params[:id]).first if params[:id]
  end

  def member_params
    params.require(:member).permit(:name, :student_number, :account, :password, :password_confirmation, :is_admin)
  end
end
