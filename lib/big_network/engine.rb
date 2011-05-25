require "big_network"
require "rails"

module BigNetwork
 class Engine < Rails::Engine
    rake_tasks do
      load "big_network/railties/tasks.rake"
    end
  end
end
