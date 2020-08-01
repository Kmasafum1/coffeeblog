class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  validates_uniqueness_of :post_id, scope: :user_id
  # いいね機能にバリデーションをつけます。具体的に何をするのかというと、
  # 1人が１つの投稿に対して、１つしかいいねをつけられないようにします。
  # （今回は自分の投稿にもいいねができます)
  # validates_uniqueness_ofによって、post_idとuser_id　の組が1組しかないようにバリデーションをかけました。
  
end
