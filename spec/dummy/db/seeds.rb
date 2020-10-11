1.upto(5) do |i|
  Group.create(name: "group#{i}")
  User.create(name: "user#{i}", data: { group_id: i, group_ids: [i] })
end
