class TestPassage < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create

  before_create :set_first_question
  before_update :set_next_question

  SUCCESS_RATE = 85

  def success_test?
    percent_of_complition > SUCCESS_RATE
  end

  def completed?
    self.current_question.nil?
  end

  def percent_of_complition
    (correct_questions.to_f / test.questions.count * 100).round 2
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end
    save!
  end

  def next_question
    self.test.questions.order(:id).where('id > ?', current_question.id).first
  end

  def set_first_question
    self.current_question = test.questions.first
  end

  def set_next_question
    self.current_question = next_question
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answers
    self.current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count

    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    correct_answers_count == answer_ids.count
  end
end
