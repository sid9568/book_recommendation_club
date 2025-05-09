# spec/support/devise.rb
RSpec.configure do |config|
  config.include Devise::Test::ControllerHelpers, type: :controller
end