# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Companies', type: :request do
  describe 'GET #options_select' do
    it 'should return options and OK status' do
      get '/companies/companies_options'

      expect(response).to have_http_status :ok
    end
  end
end
