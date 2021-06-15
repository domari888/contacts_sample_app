if Rails.env.production?
  # 各自ドメインを選択  (heroku domains で確認)
  host = "contacts-sample-app-staging.herokuapp.com"
  # メール配信に失敗した場合にエラーを発生
  ActionMailer::Base.raise_delivery_errors = true
  Actionmailer::Base.delivery_method = :smtp
  ActionMailer::Base.default_url_options = { host: host }
  ActionMailer::Base.smtp_settings = {
    port: 587,
    address: "smtp.gmail.com",
    user_name: Rails.application.credentials.gmail[:address],
    password: Rails.application.credentials.gmail[:password],
    domain: host,
    authentication: "plain"
  }
end