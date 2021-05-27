defmodule TheGame.TwilioApi do
  use Tesla, only: [:post], docs: false

  plug Tesla.Middleware.BaseUrl, "https://api.twilio.com"
  plug Tesla.Middleware.FormUrlencoded
  plug Tesla.Middleware.JSON

  plug Tesla.Middleware.Headers, [
    {"authorization",
     "Basic #{
       Base.encode64(
         "#{System.get_env("TWILIO_ACCOUNT_SID")}:#{System.get_env("TWILIO_AUTH_TOKEN")}"
       )
     }"}
  ]

  def send_test_sms_to_self do
    account_sid = System.get_env("TWILIO_ACCOUNT_SID")
    url = "/2010-04-01/Accounts/#{account_sid}/Messages.json"

    req_body = %{
      "Body" => "Hello from THE-GAME!",
      "From" => System.get_env("TWILIO_TRIAL_NUMBER"),
      "To" => System.get_env("PERSONAL_NUMBER")
    }

    post(url, req_body)
  end
end
