class Model
  include AttrJson::Model
  include AttrJson::Associations

  attr_json :group_id, :integer
  attr_json_belongs_to :group

  attr_json :group_ids, :integer, array: true
  attr_json_belongs_to :groups
end
