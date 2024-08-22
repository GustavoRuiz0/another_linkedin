# frozen_string_literal: true

class JobsController < ApplicationController
  def index
    @jobs = Job.all
    render json: @jobs
  end

  def show
    @job = Job.find(params[:id])
    render json: @job
  end

  def create
    @job = Job.new(jobs_params)
    return render json: @job, status: :created if @job.save
    render json: { errors: @job.errors }, status: :unprocessable_entity
  end

  def update
    @job = Job.find(params[:id])

    return render json: @job, status: :ok if @job.update(jobs_params)

    render json: { errors: @job.errors }, status: :unprocessable_entity
  end

  def destroy
    @job = Job.find(params[:id])

    return render json: 'Job Deleted', status: :no_content if @job.destroy

    render json: { errors: @job.errors }, status: :unprocessable_entity
  end

  private

  def authenticate_user!
    token = request.headers['Authorization']&.split(' ')&.last
    if token.present?
      begin
        decoded_token = JWT.decode(token, Rails.application.credentials.devise_jwt_secret_key!, true, algorithm: 'HS256')
        jwt_payload = decoded_token.first
        @current_user = User.find(jwt_payload['sub'])
      rescue JWT::DecodeError
        render json: { error: 'Unauthorized' }, status: :unauthorized
      end
    else
      render json: { error: 'Stay logged for this' }, status: :unauthorized
    end
  end

  def current_user
    @current_user
  end

  def authorize_admin!
    render json: { error: 'Forbidden' }, status: :forbidden unless current_user&.admin?
  end

  def jobs_params
    params.require(:job).permit(:job_type, :title, :description, :salary, :location, :company_id)
  end
end
