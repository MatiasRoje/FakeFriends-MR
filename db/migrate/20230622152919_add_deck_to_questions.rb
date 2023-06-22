class AddDeckToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_column :questions, :deck, :string
  end
end
