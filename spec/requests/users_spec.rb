require 'rails_helper'

RSpec.describe "Users", type: :request do

  describe "GET /users" do

    subject { get(users_path) }

    before do
      create_list(:user, 3)
    end

    it "ユーザーの一覧が取得できる" do
      subject
      res = JSON.parse(response.body)
      expect(res.count).to eq 3
      expect(res[0].keys).to include("account","name","email")
      expect(subject).to eq 200
    end

  end

  describe "GET /users/:id" do
    
    subject { get(user_path(user_id)) }

    context "指定したidのユーザーが存在する場合" do
      let(:user){ create(:user) }
      let(:user_id){user.id}

      it "任意のユーザーの値が取得できる" do
        subject
        res = JSON.parse(response.body)
        expect(response).to have_http_status(200)

        expect(res["account"]).to eq user.account
        expect(res["name"]).to eq user.name
        expect(res["email"]).to eq user.email
      end

    end

    context "指定したidのユーザーが存在しない場合" do
      let(:user_id) {10000}

      it "ユーザーが見つからない" do
        expect { subject }.to raise_error ActiveRecord::RecordNotFound
      end

    end

  end

  describe "POST /users" do
    it "ユーザーのレコードが作成できる" do
    end
  end

  describe "PATCH /users/:id" do
    it "任意のユーザーのレコードを更新できる" do
    end
  end

  describe "DELETE /users/:id" do
    it "任意のユーザーのレコードを削除できる" do
    end
  end

end
