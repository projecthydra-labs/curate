require 'spec_helper'

describe Curate::UserProfilesController do
  describe "#show" do
    context 'Person object exists' do
      let(:person) { FactoryGirl.create(:person_with_user) }
      before { sign_in person.user }
      it 'should redirect to profile page' do
        get :show
        response.should redirect_to person_path(person)
      end
    end

    context 'Person object does not exist' do
      let(:user) {FactoryGirl.create(:user) }
      before { sign_in user }
      it 'should redirect to user registration page' do
        get :show
        response.should redirect_to edit_user_registration_path
      end
    end
  end

describe Curate::UserProfilesController do
  describe "#show_proxies" do
    context 'Person object is a member of proxy depositors' do
        let(:person) {FactoryGirl.create(:person_with_user) }
        before { sign_in person.user }
        it 'should redirect to proxy depositor page' do
          get :show_proxies
          response.should redirect_to person_depositors_path(person)
        end
      end
    end
  end
end
