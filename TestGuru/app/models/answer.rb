class Answer < ApplicationRecord
  belongs_to :questions

  validate :validate_max_answers

  scope :correct, -> { where(correct: true) }

  private

  def validate_max_answers
    errors.add(:question) if question.answers.answers_id > 4
  end
end
