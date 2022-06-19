class RelationshipService
  def initialize(user, other_user)
    @user = user
    @other_user = other_user
    @user_relationships = user.active_relationships
  end

  class << self
    def following?(user, other_user)
      new(user, other_user).following?
    end

    def follow(user, other_user)
      new(user, other_user).follow
    end

    def unfollow!(user, other_user)
      new(user, other_user).unfollow!
    end

    def new_followers_in_month(user)
      user.followers
          .where('relationships.created_at >= ?', DateTime.now.beginning_of_month)
          .where('relationships.created_at <= ?', DateTime.now.end_of_month)
    end

    def top_10_users_with_most_followers
      User.left_joins(:followers).group(:id).order('COUNT(users.id) DESC').limit(10)
    end
  end

  def following?
    @user_relationships.find_by_followed_id(@other_user.id).present?
  end

  def follow
    @user_relationships.find_or_create_by!(followed_id: @other_user.id)
  end

  def unfollow!
    @user_relationships.find_by!(followed_id: @other_user.id).destroy!
  end
end
