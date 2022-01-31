class UserSerializer < ActiveModel::Serializer
  attributes :id,
             :name,
             :postCount,
             :posts

  def postCount
    object.posts.count
  end

  def posts
    object.posts.map do |op|
      PostSerializer.new(op, scope: scope, root: false)
    end
  end
end
