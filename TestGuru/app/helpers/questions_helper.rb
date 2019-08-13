module QuestionsHelper
  def question_header(question)
    test_title = question.test_title
    if question.persisted?
      "Edit #{test_title} question"
    else
      "Create New #{test_title} question"
    end
  end
end
