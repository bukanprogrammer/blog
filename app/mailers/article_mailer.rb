# app/mailers/article_mailer.rb

class ArticleMailer < ApplicationMailer
  default from: 'Bukan Programmer <id.bukanprogrammer@gmail.com>'

  def self.send_request(row, email)

    # emails = Subscriber.all.map{|e| e.email}

    emails = email
    
    emails.each do |email|
      new_request(email,row).deliver_now
    end
  end

  def new_request(email, row)
    @item = row

    mail(to: email, subject: 'Artikel baru dari Bukan Programmer')

  end
end
