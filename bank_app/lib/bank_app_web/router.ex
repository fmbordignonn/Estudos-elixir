defmodule BankAppWeb.Router do
  use BankAppWeb, :router

  # esses plugs é uma maneira de extender o framework
  # plugs são convenções para alterar a conexão q ta rolando no framework
  # o plug abaixo por exemplo diz q todas as rotas do serviço vão trabalhar com json
  pipeline :api do
    plug :accepts, ["json"]
  end

  # diz que /api vai usar o pipeline :api acima
  scope "/api", BankAppWeb do
    pipe_through :api

    get "/", WelcomeController, :index
  end

  # Enable LiveDashboard in development
  if Application.compile_env(:bank_app, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: BankAppWeb.Telemetry
    end
  end
end
