require 'rails_helper'

RSpec.describe '/articles routes' do
	describe '#index' do
		it 'returns a success response' do
			get '/index'
			expect(response).to have_http_status(:ok)
		end
	end	
end