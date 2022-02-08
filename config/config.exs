# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :real_time,
  ecto_repos: [RealTime.Repo]

# Configures the endpoint
config :real_time, RealTimeWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [view: RealTimeWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: RealTime.PubSub,
  live_view: [signing_salt: "a6zPx1qR"]

# Configures the mailer
#
# By default it uses the "Local" adapter which stores the emails
# locally. You can see the emails in your browser, at "/dev/mailbox".
#
# For production it's recommended to configure a different adapter
# at the `config/runtime.exs`.
config :real_time, RealTime.Mailer, adapter: Swoosh.Adapters.Local

# Swoosh API client is needed for adapters other than SMTP.
config :swoosh, :api_client, false

if config_env() == :prod or config_env() == :dev do
  # Configuring the mailer
config :real_time, RealTime.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("SENDGRID_API_KEY")

config :hcaptcha,
  public_key: System.get_env("HCAPTCHA_PUBLIC_KEY"),
  secret: System.get_env("HCAPTCHA_PRIVATE_KEY")

config :ex_twilio, account_sid:   {:system, "TWILIO_ACCOUNT_SID"},
                   auth_token:    {:system, "TWILIO_AUTH_TOKEN"}

  config :swoosh, :api_client, Swoosh.ApiClient.Finch
end



config :tailwind,
  version: "3.0.13",
  default: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Configure esbuild (the version is required)
config :esbuild,
  version: "0.14.0",
  default: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :surface, :components, [
  {Surface.Components.Form.ErrorTag, default_translator: {RealTimeWeb.ErrorHelpers, :translate_error}}
]




# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
