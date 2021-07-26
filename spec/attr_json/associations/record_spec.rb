context AttrJson::Associations::Record do
  let(:user) { User.find(1) }

  it 'returns record' do
    user.group
    expect(user.instance_variable_get('@attr_json_associations_cache')).not_to eq({})
    user.reload
    expect(user.instance_variable_get('@attr_json_associations_cache')).to eq({})
  end
end
