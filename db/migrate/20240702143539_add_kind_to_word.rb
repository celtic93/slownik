class AddKindToWord < ActiveRecord::Migration[7.1]
  def change
    add_column :words, :kind, :integer, default: 0, comment: "Type of exercise to separate vocabulary and grammar"
  end
end
