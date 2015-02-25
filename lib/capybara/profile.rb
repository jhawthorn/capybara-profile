require "capybara/profile/version"

module Capybara
  module Profile
    def self.enable
      Capybara.app = Rack::Builder.new do
        map "/" do
          use StackProf::Middleware,
            enabled: true,
            mode: :wall,
            interval: 100,
            save_at_exit: true
          run Rails.application
        end
      end.to_app
    end
  end
end
