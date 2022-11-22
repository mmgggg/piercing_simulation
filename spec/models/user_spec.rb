require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }

  describe 'ユーザー登録バリデーション' do
    it '全てのフォームが埋まっていれば登録できる' do
      expect(build(:user)).to be_valid
    end

    it 'nameがないと登録できない' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it '同じnameで登録できない' do
      user = create(:user)
      user_has_same_name = build(:user, name: user.name, email: "test2@example.com" )
      user_has_same_name.valid?
      expect(user_has_same_name.errors[:name]).to include("はすでに存在します")
    end

    it 'emailがないと登録できない' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it '同じemailで登録できない' do
      user = create(:user)
      user_has_same_email = build(:user, name: "test2", email: user.email )
      user_has_same_email.valid?
      expect(user_has_same_email.errors[:email]).to include("はすでに存在します")
    end

    it '確認用パスワードが違う場合登録できない' do
      user = build(:user, password: "password", password_confirmation: "passsword")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とpasswordの入力が一致しません")
    end
  end
end
