class InquiryMailer < ApplicationMailer
  ##### 送信元アドレス
  default from: "lapan@example.com"
  ##### 送信先アドレス
  default to: "info@carot.co.jp"

  def received_email(inquiry)
    ##### メール件名
    mail_subject = "問い合わせフォームから問い合わせがありました"

    @inquiry = inquiry
    mail(:subject => mail_subject)
  end
end
