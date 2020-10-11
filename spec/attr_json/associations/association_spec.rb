describe AttrJson::Associations::Association do
  context 'belongs_to' do
    let(:association) {
      AttrJson::Associations::Association::BelongsTo.new(Group, [:group, ->{ order(:id) }])
    }

    it 'has a class_name' do
      expect(association.class_name).to eq('Group')
    end

    it 'has a klass' do
      expect(association.klass).to eq(Group)
    end

    it 'has a primary_key' do
      expect(association.primary_key).to eq(:id)
    end

    it 'has a foreign_key' do
      expect(association.foreign_key).to eq(:group_id)
    end

    it 'has a scoped relation' do
      expect(association.scoped.to_sql).to include('ORDER BY')
    end
  end
end
