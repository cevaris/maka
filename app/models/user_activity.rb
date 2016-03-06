class UserActivity < ActiveRecord::Base

  belongs_to :user
  belongs_to :activity
  enum status: {available: 0, accepted: 1, completed: 2, abandoned: 3}

  def self.where_status(user_id, activity_id)
    ua = UserActivity.where(user_id: user_id, activity_id: activity_id)
    if ua.first
      ua.status
    else
      UserActivity.statuses.first.first
    end
  end

end
