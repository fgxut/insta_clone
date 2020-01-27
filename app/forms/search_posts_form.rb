class SearchPostsForm
  include ActiveModel::Model

  attr_accessor :content

  def search
    if content.blank?
      Post.all.includes(:user)
    else
      Post.where('content LIKE ?', "%#{content}%").includes(:user)
    end
  end
end
