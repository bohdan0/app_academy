class RemoveAnswerChoiceIdFromQuestionsTable < ActiveRecord::Migration
  def change
    remove_column :questions, :answer_choice_id, :integer
  end
end
