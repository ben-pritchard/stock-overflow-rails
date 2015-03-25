class Answer < ActiveRecord::Base
  belongs_to :question
  validates :body, :presence => true
  validates :question_id, :presence => true
  after_create :send_user_answer_notification
  default_scope -> { order(:votes => :desc)}

  def send_user_answer_notification
    CustomerMailer.send_user_answer_notification(User.find((Question.find(self.question_id).user_id))).deliver_now

  end

  def upvote
    self.votes += 1
  end
end
