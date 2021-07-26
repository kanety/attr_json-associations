describe AttrJson::Associations::Loader::HasOne do
  context 'FK integer' do
    context 'PK jsonb integer' do
      let(:model) { Model.new(user_id: 1) }

      it 'returns record' do
        expect(model.user.id).to eq(1)
      end
    end

    context 'PK jsonb nil' do
      let(:model) { Model.new(user_id: nil) }

      it 'returns nil' do
        expect(model.user).to eq(nil)
      end
    end

    context 'PK jsonb array' do
      let(:model) { Array::Model.new(user_ids: [1]) }

      it 'returns record' do
        expect(model.users.map(&:id)).to eq([1])
      end
    end

    context 'PK jsonb empty' do
      let(:model) { Array::Model.new(user_ids: []) }

      it 'returns nil' do
        expect(model.users.to_a).to eq([])
      end
    end
  end
end
