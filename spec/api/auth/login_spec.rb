require 'rails_helper'

FactoryBot.define do
  factory :user do
    email { "demo@gmail.com" }
    password  { "000000" }
    jti { SecureRandom.uuid }
  end
end

describe 'POST /auth/sign_in', type: :api do
  let(:user) {create(:user)}
  let(:url) {'/auth/sign_in'}
  let(:params) do
    {
      user: {
        email: user.email,
        password: user.password
      }
    }
  end

  context 'when login params are incorrect' do
    before { post url }
    
    it 'returns unathorized status' do
      expect(last_response.status).to eq 401
    end
    
    it 'response with a message need to sign in or sign up' do
      expect(last_response.body).to eq 'You need to sign in or sign up before continuing.'
    end
  end

  context 'when login params are correct' do
    before { get '/home', params: params }
    it 'returns 200' do
      # debugger
      p last_response
      expect(last_response.status).to eq 200
    end
  end

end