namespace :todo do
  desc "TODO"
  task delete_items: :environment do
    Item.where("created_at < =?", Time.Now - 7.days).destroy_alldelete todo where created_at - datetime.now
  end

end
