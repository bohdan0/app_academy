class Response < ActiveRecord::Base
  validates :question_id, :answer_choice_id, presence: true
  validate :respondent_already_answered?

  belongs_to :respondant,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    question.responses.where.not(id: id)
  end

  def respondent_already_answered?
    if sibling_responses.exists?(user_id: user_id)
      errors[:response] << 'already exist'
    end
  end

end
