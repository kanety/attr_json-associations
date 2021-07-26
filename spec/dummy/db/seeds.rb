ActiveRecord::Base.connection.execute("TRUNCATE users, groups RESTART IDENTITY")

1.upto(5) do |i|
  Group.create(name: "group#{i}", _id: i, _parent_ids: [i-1])
  User.create(name: "user#{i}", data: { group_id: i, group_ids: [i, i + 1] })
end
