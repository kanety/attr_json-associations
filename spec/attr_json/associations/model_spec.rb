describe AttrJson::Associations::Model do
  context 'belongs_to' do
    context 'single value' do
      it 'returns an instance' do
        record = Model.new(group_id: 1)
        expect(record.group.id).to eq(1)
      end

      it 'returns nil value for nil' do
        record = Model.new(group_id: nil)
        expect(record.group).to eq(nil)
      end
    end

    context 'arary value' do
      it 'returns array instances' do
        record = Model.new(group_ids: [1, 2])
        expect(record.groups.map(&:id)).to eq([1, 2])
      end

      it 'returns an empty array for empty array' do
        record = Model.new(group_ids: [])
        expect(record.groups).to eq([])
      end
    end
  end
end
