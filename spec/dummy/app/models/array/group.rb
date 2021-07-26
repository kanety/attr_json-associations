class Array::Group < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_has_many :users, foreign_key: :group_ids
  attr_json_has_one :user, foreign_key: :group_ids
end
