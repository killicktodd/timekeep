class AddAttachmentImageToWatches < ActiveRecord::Migration
  def self.up
    change_table :watches do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :watches, :image
  end
end
