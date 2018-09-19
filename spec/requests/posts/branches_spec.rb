require 'rails_helper'
include Warden::Test::Helpers

RSpec.describe "Branch Page Requests", :type => :request do
    shared_examples 'render_templates' do 
        it 'renders hobby template' do 
            get '/posts/hobby'
            expect(response).to render_template(:hobby)
        end

        it 'renders study template' do 
            get '/posts/study'
            expect(response).to render_template(:study)
        end

        it 'renders team template' do 
            get '/posts/team'
            expect(response).to render_template(:team)
        end
    end

    context "Not signed in user" do 
        it_behaves_like 'render_templates'do
        end
    end

    context "signed in user" do 
        let(:user) {create(:user)}
        before(:each) {login_as user}

        it_behaves_like 'render_templates'
    end
end