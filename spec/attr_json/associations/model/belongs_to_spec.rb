describe AttrJson::Associations::Loader::BelongsTo do
  context 'PK integer' do
    context 'FK jsonb integer' do
      let(:model) { Model.new(group_id: 1) }

      it 'returns record' do
        expect(model.group.id).to eq(1)
      end
    end

    context 'FK jsonb nil' do
      let(:model) { Model.new(group_id: nil) }

      it 'returns nil' do
        expect(model.group).to eq(nil)
      end
    end

    context 'FK jsonb array' do
      let(:model) { Array::Model.new(group_ids: [1, 2]) }

      it 'returns records' do
        expect(model.groups.map(&:id)).to eq([1, 2])
      end
    end

    context 'FK jsonb empty array' do
      let(:model) { Array::Model.new(group_ids: []) }

      it 'returns empty' do
        expect(model.groups.to_a).to eq([])
      end
    end
  end
end
