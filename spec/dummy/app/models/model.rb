class Model
  include AttrJson::Model
  include AttrJson::Associations

  attr_json :group_id, :integer
  attr_json_belongs_to :group

  attr_json :user_id, :integer
  attr_json_has_many :users, primary_key: :user_id, foreign_key: :id
  attr_json_has_one :user, primary_key: :user_id, foreign_key: :id
end
