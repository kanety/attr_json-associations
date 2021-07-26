describe AttrJson::Associations::Loader::HasOne do
  context 'FK jsonb integer' do
    context 'PK integer' do
      let(:group) { Group.new(id: 1) }

      it 'returns record' do
        expect(group.user.id).to eq(1)
      end
    end

    context 'PK nil' do
      let(:group) { Group.new(id: nil) }

      it 'returns nil' do
        expect(group.user).to eq(nil)
      end
    end
  end

  context 'FK jsonb array' do
    context 'PK integer' do
      let(:group) { Array::Group.new(id: 1) }

      it 'returns record' do
        expect(group.user.id).to eq(1)
      end
    end

    context 'PK nil' do
      let(:group) { Array::Group.new(id: nil) }

      it 'returns nil' do
        expect(group.user).to eq(nil)
      end
    end
  end
end
