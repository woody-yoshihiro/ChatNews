class AddOpinionsCountToClip < ActiveRecord::Migration[5.2]
  def change
    add_column :clips, :opinions_count, :integer, default: 0
    add_column :clips, :user_clips_count, :integer, default: 0
  end
end
