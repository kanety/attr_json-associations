class User < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json :group_id, :integer
  attr_json_belongs_to :group
end
