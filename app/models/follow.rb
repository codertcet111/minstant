class Follow < ApplicationRecord
  belong_to :follower, foreign_key: 'user_id', class_name: 'User'
  belong_to :following, foreign_key: 'following_id', class_name: 'User'
end
