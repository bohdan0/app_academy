class RemoveQuestionIdFromPoll < ActiveRecord::Migration
  def change
    remove_column :polls, :question_id, :integer
  end
end
