class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :name, length: 64, null: false
      t.string :mime_type, length: 64, null: false
      t.binary :data, null: false
    end
  end
end
