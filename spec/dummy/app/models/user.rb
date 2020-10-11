class User < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json :group_id, :integer
  attr_json_belongs_to :group

  attr_json :group_ids, :integer, array: true
  attr_json_belongs_to :groups

  class Content
    include AttrJson::Model
    attr_json :group_id, :integer
    attr_json :group_ids, :integer, array: true
  end

  attr_json :content, Content.to_type
end
