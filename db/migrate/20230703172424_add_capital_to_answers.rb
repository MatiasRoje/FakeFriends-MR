class AddCapitalToAnswers < ActiveRecord::Migration[7.0]
  def change
    add_column :answers, :capital, :boolean, :default => false
  end
end
