module ApplicationHelper
  def follow_button(user)
    link_to 'Follow', relationships_path(id: user.id), method: :post, class: 'btn btn-success btn-sm'
  end

  def unfollow_button(user)
    link_to 'Unfollow', relationship_path(user.id), method: :delete, class: 'btn btn-danger btn-sm'
  end
end
