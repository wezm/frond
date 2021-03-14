LuckyFlow.configure do |settings|
  settings.stop_retrying_after = 200.milliseconds
  settings.base_uri = Lucky::RouteHelper.settings.base_uri
  if ENV["LUCKYFLOW_DRIVER_PATH"]? # Used in CI
    settings.driver_path = ENV["LUCKYFLOW_DRIVER_PATH"]
  end
end
Spec.before_each { LuckyFlow::Server::INSTANCE.reset }
