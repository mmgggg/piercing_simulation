require 'rails_helper'

RSpec.describe "CoodinateImages", type: :system do
  # before do
  #   driven_by(:rack_test)
  # end
  # pending "add some scenarios (or delete) #{__FILE__}"
  let(:user) { FactoryBot.create(:user) }

  describe "投稿" do
    before {login(user)}
    context "正常に投稿できる" do
      it "画像があれば投稿できる" do
        visit new_coordinate_image_path
        attach_file 'Image', "#{Rails.root}/spec/fixtures/test_sample.png"
        fill_in 'Tag', with: nil
        click_button 'Posts'
        expect(page).to have_content "投稿しました"
      end

      it "タグをつけて投稿できる" do
        visit new_coordinate_image_path
        attach_file 'Image', "#{Rails.root}/spec/fixtures/test_sample.png"
        fill_in 'Tag', with: 'test' 
        click_button 'Posts'
        expect(page).to have_content "投稿しました"
      end

      it "複数のタグをつけて投稿できる" do
        visit new_coordinate_image_path
        attach_file 'Image', "#{Rails.root}/spec/fixtures/test_sample.png"
        fill_in 'Tag', with: 'test, test2, test3' 
        click_button 'Posts'
        expect(page).to have_content "投稿しました"
      end
    end

    context "投稿できない" do
      it "画像がないと投稿できない" do
        visit new_coordinate_image_path
        attach_file 'Image', nil
        fill_in 'Tag', with: nil
        click_button 'Posts'
        expect(page).to have_content "投稿できませんでした"
      end
    end
  end
end
