namespace :rcqrs do
  namespace :db do
    desc "drop all databases and recreate (including event storage tables)"
    task :recreate => [:environment, 'db:reset'] do |t|
      config = YAML.load_file(File.join(Rails.root, 'config/event_storage.yml'))[Rails.env]
      event_store = EventStore::Adapters::ActiveRecordAdapter.new(config)
    
      # Drop event tables
      event_store.provider_connection.execute 'drop table event_providers'
      event_store.event_connection.execute 'drop table events'
    
      # Recreate event storage tables
      EventStore::Adapters::ActiveRecordAdapter.new(config)
    end
  end
end