module Confirmable
  extend ActiveSupport::Concern
  # インクルードの際に、include do end 間が動作
  included do

     # ***** 処理の流れ *****
    # 「確認」ボタンを押す --> エラー（submitted: ""） --> new
    # 「確認」ボタンを押す --> エラー無し（submitted: "1"） --> new（確認画面）

    # 「戻る」ボタンを押す（confirmed: ""） --> submitted: "" --> new
    # 「送信」ボタンを押す（submitted: "1", confirmed: "1"） --> create
    
    validates :submitted, acceptance: true
    validates :confirmed, acceptance: true

    after_validation :confirming

    private

    def confirming
      # 送信ボタンをクリックして、ユーザーの入力にエラーが存在しない時
      if self.submitted == "" && self.errors.keys == [:submitted]
        # 送信ボタンを"1"にする
        self.submitted = "1"
      end
      # 戻るボタンを押した時,送信ボタンを""にする
      self.submitted = "" if self.confirmed == ""

      errors.delete :submitted
      errors.delete :confirmed
    end
  end
end