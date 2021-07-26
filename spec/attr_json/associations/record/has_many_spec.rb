describe AttrJson::Associations::Loader::HasMany do
  context 'FK jsonb integer' do
    context 'PK integer' do
      let(:group) { Group.find(1) }

      it 'returns records' do
        expect(group.users.map(&:id)).to eq([1])
      end
    end

    context 'PK nil' do
      let(:group) { Group.new(id: nil) }

      it 'returns empty' do
        expect(group.users.to_a).to eq([])
      end
    end
  end

  context 'FK jsonb array' do
    context 'PK integer' do
      let(:group) { Array::Group.find(1) }

      it 'returns records' do
        expect(group.users.map(&:id)).to eq([1])
      end
    end

    context 'PK nil' do
      let(:group) { Array::Group.new(id: nil) }

      it 'returns empty' do
        expect(group.users.to_a).to eq([])
      end
    end
  end
end
