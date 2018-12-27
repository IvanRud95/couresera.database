RSpec.configure do |config|

  config.before { allow($stdout).to receive(:puts) }

  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end


  config.mock_with :rspec do |mocks|
    # Prevents you from mocking or stubbing a method that does not exist on
    # a real object. This is generally recommended, and will default to
    # `true` in RSpec 4.
    mocks.verify_partial_doubles = true
  end

=begin

  config.warnings = true
 
  if config.files_to_run.one?
   
    config.default_formatter = 'doc'
  end
 
  config.profile_examples = 10
 
  config.order = :random
 
  Kernel.srand config.seed
=end
end
