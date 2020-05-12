require 'rails_helper'

RSpec.describe User, type: :model do
  context "account を指定しているとき" do
    it "ユーザーが作られる" do
      user = User.new(name: "hiroaki", account: "hiroaki", email: "hiroaki@example.com")
      expect(user).to be_valid
    end
  end
  
  context "accountを指定していないとき"do
    it "エラーする"do
      user = User.new(name: "hiroaki", account: nil, email: "hiroaki@example.com")
                #変数userにaccountの値を欠いた、新しいインスタンスを代入。
      user.valid?  #userにバリデーションを行う。

      expect(user.errors.messages[:account]).to include "can't be blank"
                #エラーメッセージが含まれている（include）か。
    end
  end

  context "同名のaccountが存在するとき"do
    it "エラーする"do
      User.create!(name: "hiroaki", account: "hiroaki", email:"hiroaki@example.com")
      user = User.new(name: "garoad", account: "hiroaki", email: "gandum.uruyo@gandumx.com")
      user.valid?

      expect(user.errors.messages[:account]).to include "has already been taken"
      
    end
  end

end
