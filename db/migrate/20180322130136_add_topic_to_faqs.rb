class AddTopicToFaqs < ActiveRecord::Migration[5.1]
  def change
    add_column :faqs, :topic, :string
  end
end
