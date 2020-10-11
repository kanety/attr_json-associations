class Group < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json_has_many :users, foreign_key: :group_id
  attr_json_has_many :users_with_array, foreign_key: :group_ids, class_name: 'User'
end
