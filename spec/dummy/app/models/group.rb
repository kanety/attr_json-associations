class Group < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json_has_many :users
  attr_json_has_one :user

  attr_json :_id, :integer
  attr_json :_parent_ids, :integer, array: true
  attr_json_belongs_to :parents, class_name: self.name, primary_key: :_id, foreign_key: :_parent_ids
end
