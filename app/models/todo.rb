class Todo < ActiveRecord::Base
  belongs_to :user
  has_one :list
  validate :description, presence: true, length: {maximum:300}

end
