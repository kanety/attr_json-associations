class Array::User < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json :group_ids, :integer, array: true
  attr_json_belongs_to :groups
end
