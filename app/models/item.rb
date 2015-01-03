class Item < ActiveRecord::Base
  belongs_to :list

   def days_left
     (created_at.to_date - DateTime.now.to_date).to_i + 7
   end
end

