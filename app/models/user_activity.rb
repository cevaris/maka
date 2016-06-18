class UserActivity < ActiveRecord::Base
  STATUS_AVAILABLE = 'available'
  STATUS_ACCEPT = 'accepted'
  STATUS_COMPLETE = 'completed'
  STATUS_ABANDON = 'abandoned'

  belongs_to :user
  belongs_to :activity
  enum status: {available: 0, accepted: 1, completed: 2, abandoned: 3}

  def self.next_status(status)
    case status
      when STATUS_AVAILABLE, STATUS_ABANDON, STATUS_COMPLETE
        [['Accpet', STATUS_ACCEPT]]
      when STATUS_ACCEPT
        [['Complete', STATUS_COMPLETE], ['Abandon', STATUS_ABANDON]]
      else
        []
    end
  end

end
