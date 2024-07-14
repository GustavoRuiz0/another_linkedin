# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Jobs', type: :request do
  describe 'GET #index' do
    it 'should return with success code' do
      get jobs_path

      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'should return success if find job' do
      @job = FactoryBot.create(:job)

      get jobs_path(@job.id)

      expect(response).to have_http_status(:success)
    end

    it 'should return not_found and redirect if job dont exists' do
      get '/jobs/03483764723034'

      expect(response).to have_http_status(:not_found)
    end
  end

  describe 'PUT/PAT #update' do
    context 'when is successfully updated' do
      before(:each) do
        @job = FactoryBot.create(:job)
        patch "/jobs/#{@job.id}", params: {
          id: @job.id,
          job: { title: 'pao de batata' }, format: :json
        }
      end

      it 'renders the json representation for updated job' do
        @job_response = JSON.parse(response.body, symbolize_names: true)
        expect(@job_response[:title]).to eql 'pao de batata'
      end

      it 'responds with :ok' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when is not updated' do
      before(:each) do
        @job = FactoryBot.create(:job)
        patch "/jobs/#{@job.id}", params: {
          id: @job.id,
          job: { title: 'A' }, format: :json
        }
      end

      it 'renders an error json' do
        job_response = JSON.parse(response.body, symbolize_names: true)
        expect(job_response).to have_key(:errors)
      end

      it 'renders the json errors on why the job could not be updated' do
        job_response = JSON.parse(response.body, symbolize_names: true)
        expect(job_response[:errors][:title]).to include 'is too short (minimum is 10 characters)'
      end

      it 'responds with :unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    describe 'DELETE #destroy' do
      before(:each) do
        @job = FactoryBot.create(:job)
        delete "/jobs/#{@job.id}", params: { id: @job.id }
      end

      it 'responds with :no_content' do
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
