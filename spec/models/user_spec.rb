require 'rails_helper'

RSpec.describe User, type: :model do
  context "accountを指定しているとき" do
    it "ユーザーが作られる" do
      user = create(:user)
      expect(user).to be_valid
    end
  end
  
  context "accountを指定していないとき"do
    it "エラーする"do
      user = build(:user, account: nil)
                #変数userにaccountの値を欠いた、新しいインスタンスを代入。
      user.valid?  #userにバリデーションを行う。

      expect(user.errors.messages[:account]).to include "can't be blank"
                #エラーメッセージが含まれている（include）か。
    end
  end

  context "同名のaccountが存在するとき"do
    it "エラーする"do
      create(:user, account: "hiroaki")
            #インスタンスを作成する。
      user = build(:user, account: "hiroaki")
            #accountが被るように新規作成。
      user.valid?
            #userにバリデーションを行う。
      expect(user.errors.messages[:account]).to include "has already been taken"
            #エラーメッセージが含まれているか？
    end
  end

end
