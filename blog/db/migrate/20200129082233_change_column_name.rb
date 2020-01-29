class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :articles, :birth_date, :published_date
  end
end
