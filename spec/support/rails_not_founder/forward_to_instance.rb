RSpec::Matchers.define :forward_to_instance do |expected|
  match do |actual|
    actual = actual.class unless actual.is_a?(Class)
    instance = instance_double(actual, expected => :return)
    rspec_args = @args.any? ? @args : [no_args]
    allow(actual).to receive(:new).with(*rspec_args).and_return(instance)
    actual.send(expected, *@args) == :return
  end

  0.upto(10) do |index|
    chain format("with_%<index>d_args", index: index) do
      args = Array.new index, :arg
      @args = args
    end
  end

  chain :with_no_args do
    with_0_args
  end

  chain :with_1_arg do
    with_1_args
  end

  chain :with do |*args|
    @args = args
  end
end
