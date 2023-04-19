class AddFormStepToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :form_step, :string
  end
end
