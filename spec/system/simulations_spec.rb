require 'rails_helper'

RSpec.describe "Simulations", js: true, type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"

  describe "シミュレーション機能" do
    context "ゲストユーザーとしてシミュレーションする" do
      it "クリックすると画像がコピーされる" do
        visit simulation_page_path
        find('#image-1').click
        expect(page).to have_css '#copy-image1'
      end

      it "コピー画像をクリックするとフレームが出る" do
        visit simulation_page_path
        find('#image-1').click
        find('#copy-image1').click
        expect(page).to have_css '.moveable-control-box'
      end

      it "ダブルクリックをするとコピー画像が消える" do
        visit simulation_page_path
        find('#image-1').click
        find('#copy-image1').double_click
        expect(page).to have_no_css '#copy-image1'
      end
    end

    context "ログインしてシミュレーションする" do
      let(:user) { FactoryBot.create(:user) }
      before {login(user)}
      it "クリックすると画像がコピーされる" do
        visit simulation_page_path
        find('#image-1').click
        expect(page).to have_css '#copy-image1'
      end

      it "コピー画像をクリックするとフレームが出る" do
        visit simulation_page_path
        find('#image-1').click
        find('#copy-image1').click
        expect(page).to have_css '.moveable-control-box'
      end

      it "ダブルクリックをするとコピー画像が消える" do
        visit simulation_page_path
        find('#image-1').click
        find('#copy-image1').double_click
        expect(page).to have_no_css '#copy-image1'
      end

      it "シミュレーション画面から投稿できる" do
        visit simulation_page_path
        find('#image-1').click
        click_on 'Post'
        expect(page).to have_content '投稿しました' 
      end
    end
  end
end
