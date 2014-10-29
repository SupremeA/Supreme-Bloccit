class CommentPolicy < AplicationPolicy
  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end
