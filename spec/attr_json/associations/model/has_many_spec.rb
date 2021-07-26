describe AttrJson::Associations::Loader::HasMany do
  context 'FK integer' do
    context 'PK jsonb integer' do
      let(:model) { Model.new(user_id: 1) }

      it 'returns records' do
        expect(model.users.map(&:id)).to eq([1])
      end
    end

    context 'PK jsonb nil' do
      let(:model) { Model.new(user_id: nil) }

      it 'returns empty' do
        expect(model.users.to_a).to eq([])
      end
    end

    context 'PK jsonb array' do
      let(:model) { Array::Model.new(user_ids: [1]) }

      it 'returns records' do
        expect(model.users.map(&:id)).to eq([1])
      end
    end

    context 'PK jsonb empty' do
      let(:model) { Array::Model.new(user_ids: []) }

      it 'returns empty' do
        expect(model.users.to_a).to eq([])
      end
    end
  end
end
