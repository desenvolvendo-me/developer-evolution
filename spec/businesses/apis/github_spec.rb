require 'rails_helper'

RSpec.describe Apis::Github do

  context 'levels' do
    before do
      @student = create(:student)
      @client = Apis::Github.new({ access_token: "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" }).client

    end

    context "login" do
      it 'marcodotcastro' do
        user = @client.user "marcodotcastro"
        expect(user.login).to eq("marcodotcastro")
      end

      it 'jhonesaly' do
        user = @client.user "jhonesaly"
        expect(user.login).to eq("jhonesaly")
      end
    end

  end

end