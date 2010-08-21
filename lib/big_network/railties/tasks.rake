require 'generators/big_network/big_network_generator'
namespace :big_network do 
  namespace :generate do
    desc "generate database migration"
    task :migration do
      BigNetworkGenerator.new.create_migration_file
    end
  end
end
