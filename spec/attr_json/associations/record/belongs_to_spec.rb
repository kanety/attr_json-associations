context AttrJson::Associations::Loader::BelongsTo do
  context 'PK integer' do
    context 'FK jsonb integer' do
      let(:user) { User.new(data: { group_id: 1 }) }

      it 'returns record' do
        expect(user.group.id).to eq(1)
      end
    end

    context 'FK jsonb nil' do
      let(:user) { User.new(data: { group_id: nil }) }

      it 'returns nil' do
        expect(user.group).to eq(nil)
      end
    end

    context 'FK jsonb array' do
      let(:user) { Array::User.new(data: { group_ids: [1, 2] }) }

      it 'returns records' do
        expect(user.groups.map(&:id)).to eq([1, 2])
      end
    end

    context 'FK jsonb empty array' do
      let(:user) { Array::User.new(data: { group_ids: [] }) }

      it 'returns empty' do
        expect(user.groups.to_a).to eq([])
      end
    end
  end

  context 'PK jsonb integer' do
    context 'FK jsonb integer' do
      let(:group) { Group.find(2) }

      it 'returns records' do
        expect(group.parents.map(&:id)).to eq([1])
      end
    end
  end
end
