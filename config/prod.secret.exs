use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :uncalote_me, UncaloteMeWeb.Endpoint,
  secret_key_base: "ObZ5X7XPiwlve96fiMclDHxKac+v7KzOWu5xBu6dQTI7lcPqJamDW1BybKr1raWy"

# Configure your database
config :uncalote_me, UncaloteMe.Repo,
  username: "postgres",
  password: "postgres",
  database: "uncalote_me_prod",
  pool_size: 15
