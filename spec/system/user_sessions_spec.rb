require 'rails_helper'

RSpec.describe "UserSessions", js: true, type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }

  describe 'ログイン前' do
    context 'フォームの入力値が正常' do
      it 'ログイン処理が成功する' do
        visit login_path
        login(user)
        expect(page).to have_content "ログインしました"
      end
    end
    context 'フォームが未入力' do
      it 'ログイン処理が失敗する' do
        visit login_path
        fill_in "email", with: nil
        fill_in "Password", with: nil
        click_button "Login"
        expect(page).to have_content "ログインに失敗しました"
      end
    end
  end

  describe 'ログイン後' do
    context 'ログアウトボタンをクリック' do
      it 'ログアウト処理が成功する' do
        visit login_path
        login(user)
        click_link 'Logout'
        expect(page).to have_content "ログアウトしました"
      end
    end

  end
end

