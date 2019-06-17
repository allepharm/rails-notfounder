RSpec::Matchers.define :forward_to_scope do |e_method, *args|
  match do |actual|
    e_klass = "%s_scope".format(e_method.to_s).camelize
    scope_klass = "%s::%s".format(described_class.to_s, e_klass).constantize
    allow(scope_klass).to receive(:call).and_return(:result)
    actual.send(e_method, *args) == :return
    expect(scope_klass).to have_received(:call)
  end
end
