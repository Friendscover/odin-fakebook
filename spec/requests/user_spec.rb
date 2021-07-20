require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context 'GET /index' do
    it 'redirects to login if currently logged out' do
      get root_path
      expect(response).to redirect_to(new_user_session_path)
    end

    it 'does not redirect if user is logged in' do
      user = User.create(email: 'testo@example.com', password: 123_456, first_name: 'testo', last_name: 'kesto')
      sign_in user
      get root_path
      expect(response).to have_http_status(:ok)
    end
  end
end
