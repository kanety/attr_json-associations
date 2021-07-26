class Array::Model
  include AttrJson::Model
  include AttrJson::Associations

  attr_json :group_ids, :integer, array: true
  attr_json_belongs_to :groups

  attr_json :user_ids, :integer, array: true
  attr_json_has_many :users, primary_key: :user_ids, foreign_key: :id
  attr_json_has_one :user, primary_key: :user_ids, foreign_key: :id
end
