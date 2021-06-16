if Rails.env.production?
  # 各自ドメインを選択  (heroku domains で確認)
  host = "contacts-sample-app.herokuapp.com"
  # メール配信に失敗した場合にエラーを発生
  ActionMailer::Base.raise_delivery_errors = true
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default_url_options = { host: host }
  ActionMailer::Base.smtp_settings = {
    port: 587,
    address: "smtp.gmail.com",
    user_name: Rails.application.credentials.gmail[:address],
    password: Rails.application.credentials.gmail[:password],
    domain: host,
    authentication: "plain"
  }

else Rails.env.development?
  ActionMailer::Base.default_url_options = { host: 'localhost:3000' }
  ActionMailer::Base.delivery_method = :letter_opener_web
end
