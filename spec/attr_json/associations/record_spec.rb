context AttrJson::Associations::Record do
  let(:user) { User.find(1) }

  it 'returns record' do
    user.group
    expect(user.instance_variable_get('@attr_json_associations_cache')).to eq({:group => user.group})
    user.reload
    expect(user.instance_variable_get('@attr_json_associations_cache')).to eq({})
  end

  context 'belongs_to' do
    it 'clears cache if FK value is changed' do
      user.group
      expect(user.instance_variable_get('@attr_json_associations_cache')).to eq({:group => user.group})
      user.group_id = nil
      expect(user.instance_variable_get('@attr_json_associations_cache')).to eq({:group => nil})
    end
  end
end
