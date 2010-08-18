namespace :db do
  task :fill_completed_on => :environment do
    Task.completed.each do |t|
      t.update_attributes(:completed_on => t.updated_at)
    end
  end
end

