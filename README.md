# AttrJson::Associations

A simple association extension for [attr_json](https://github.com/jrochkind/attr_json).

## Dependencies

* ruby 2.7+
* attr_json 1.3
* activerecord 6.0+
* activesupport 6.0+

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'attr_json-associations'
```

Then execute:

    $ bundle

## Usage

Include `AttrJson::Associations`, and define associations using `attr_json_belongs_to` and `attr_json_has_many`.
You may specify attributes defined with `attr_json` as a primary key or a foreign key.
For example:

```ruby
class Group < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_has_many :users
end

class User < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json :group_id, :integer
  attr_json_belongs_to :group
end
```

These associations generates queries as follows:

```ruby
Group.new(id: 1).users
#=> SELECT "users".* FROM "users" WHERE ("users"."data"->'group_id' = '1')

User.new(group_id: 1).group
#=> SELECT "groups".* FROM "groups" WHERE "groups"."id" = 1
```

### Options

You can speficy the following options for association definitions:

* `class_name`
* `primary_key`
* `foreign_key`

These options are same as ActiveRecord. For example:

```ruby
class Group < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_has_many :users, class_name: 'User', primary_key: :id, foreign_key: :group_id
end
```

You can also specify an additional scope for each association:

```ruby
class Group < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_has_many :users, -> { order(:id) }
end

Group.new(id: 1).users
#=> SELECT "users".* FROM "users" WHERE ("users"."data"->'group_id' = '1') ORDER BY "users"."id" ASC
```

### Array type

You can define `attr_json_belongs_to` for an array attribute. For example:

```ruby
class Array::User < ActiveRecord::Base
  include AttrJson::Record
  include AttrJson::Record::QueryScopes
  include AttrJson::Associations

  attr_json_config(default_container_attribute: :data)

  attr_json :group_ids, :integer, array: true
  attr_json_belongs_to :groups
end

Array::User.new(group_ids: [1, 2]).groups
#=> SELECT "groups".* FROM "groups" WHERE "groups"."id" IN (1, 2) ORDER BY CASE "groups"."id" WHEN 1 THEN 0 WHEN 2 THEN 1 ELSE 2 END

Array::User.new(group_ids: [2, 1]).groups
#=> SELECT "groups".* FROM "groups" WHERE "groups"."id" IN (2, 1) ORDER BY CASE "groups"."id" WHEN 2 THEN 0 WHEN 1 THEN 1 ELSE 2 END
```

Note that the returned records are ordered by the index of the array,
so the order of records in first example is different from the one in second example.

## Limitations

This gem is experimental so the various options like ActiveRecord's things are not supported.

## Contributing

Bug reports and pull requests are welcome at https://github.com/kanety/attr_json-associations.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
