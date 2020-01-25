class SearchPostsForm
  include ActiveModel::Model

  attr_accessor :content

  def search
    if content.blank?
      Post.all
    else
      Post.where('content LIKE ?', "%#{content}%")
    end
  end
end
