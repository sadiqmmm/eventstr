class AddAgendaToEvents < ActiveRecord::Migration
  def change
    add_column :events, :agenda, :string
  end
end
