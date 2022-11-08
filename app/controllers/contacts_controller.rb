class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      ContactMailer.send_mail(@contact).deliver_now
      redirect_to done_path
    else
      render :new
    end
  end

  #バリデーションエラーなどの際、入力内容を保持したまま戻るアクション
  def back
    @contact = Contact.new(contact_params)
    render :new
  end

  def done; end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
end
