require 'rails_helper'

RSpec.describe "Users", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }

  describe "ログイン前" do
    it "ログイン前はMypageにアクセスできない" do
      user = build(:user, id: 1)
      visit profiles_path(user)
      expect(page).to have_content "ログインが必要です"
    end

    it "ログインしていなくてもシミュレーションページは見れる" do
      visit simulation_page_path
      expect(page).to have_content "Simulation"
    end

    it "ログインしていなくてもイメージ一覧は見れる" do
      visit coordinate_images_path
      expect(page).to have_content "Images"
    end
  end

  describe "ログイン後" do
    before {login(user)}
    it "Mypageを見ることができる" do
      user = build(:user, id: 1)
      visit profiles_path(user)
      expect(page).to have_content "Welcome,test"
    end

    it "画像の投稿ができる" do
      user = build(:user, id: 1)
      visit new_coordinate_image_path
      attach_file 'Image', "#{Rails.root}/spec/fixtures/test_sample.png"
      click_button "Posts"
      expect(page).to have_content "投稿しました"
    end

    it "名前を変更できる" do
      user = build(:user, id: 1)
      visit edit_profiles_path(user)
      fill_in 'name', with: "testtest"
      click_on 'Update'
      expect(page).to have_content "更新しました"
    end

    it "メールアドレスを変更できる" do
      user = build(:user, id: 1)
      visit edit_profiles_path(user)
      fill_in 'email', with: "testtest@example.com"
      click_on 'Update'
      expect(page).to have_content "更新しました"
    end
  end
end
