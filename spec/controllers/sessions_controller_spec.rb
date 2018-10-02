require 'rails_helper'
#I have passed these tests, but they made them so that in the beginning,
# I was required to use the 'password' attr
# Later, when passing the usercontroller specs, i must use, has_secure_password. 
RSpec.describe SessionsController, type: :controller do
  
  before do
    User.destroy_all
  end

  let(:connie) {User.create(name: 'Connie', password: 'M4heswaran')}
  
  describe 'post create' do
    it 'logs you in with the correct password' do
      post :create, user: {name: connie.name, password: connie.password}
      expect(session[:user_id]).to eq(connie.id)
    end

    it 'rejects invalid passwords' do
      post :create, user: {name: connie.name, password: connie.password + 'x'}
      expect(session[:user_id]).to be_nil
    end

    it 'rejects empty passwords' do
      post :create, user: {name: connie.name, password: ''}
      expect(session[:user_id]).to be_nil
    end
  end
end

