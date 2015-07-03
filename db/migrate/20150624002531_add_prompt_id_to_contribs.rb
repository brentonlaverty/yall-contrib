class AddPromptIdToContribs < ActiveRecord::Migration
  def change
    add_reference :contribs, :prompt, index: true, foreign_key: true
  end
end
