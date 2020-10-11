describe AttrJson::Associations::Record do
  context 'belongs_to' do
    context 'single value' do
      it 'returns an instance' do
        user = User.new(data: { group_id: 1 })
        expect(user.group.id).to eq(1)
      end

      it 'returns nil value for nil' do
        user = User.new(data: { group_id: nil })
        expect(user.group).to eq(nil)
      end
    end

    context 'arary value' do
      it 'returns array instances' do
        user = User.new(data: { group_ids: [1, 2] })
        expect(user.groups.map(&:id)).to eq([1, 2])
      end

      it 'returns an empty array for empty array' do
        user = User.new(data: { group_ids: [] })
        expect(user.groups).to eq([])
      end
    end
  end

  context 'has_many' do
    context 'single value' do
      it 'returns an instance' do
        group = Group.new(id: 1)
        expect(group.users.map(&:id)).to eq([1])
      end

      it 'returns nil value for nil' do
        group = Group.new(id: nil)
        expect(group.users.to_a).to eq([])
      end
    end

    context 'array value' do
      it 'returns instances' do
        group = Group.new(id: 1)
        expect(group.users_with_array.map(&:id)).to eq([1])
      end

      it 'returns nil value for nil' do
        group = Group.new(id: nil)
        expect(group.users_with_array.to_a).to eq([])
      end
    end
  end
end
