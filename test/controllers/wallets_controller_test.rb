# frozen_string_literal: true
require 'test_helper'

KEY1 = 'GDZP53LPGV4LGIZVTIPDIYL2N6VC6YYUBSJE66AZTNC77F6K2CN3K4OO'

class WalletsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test 'login_success_redirection' do
    get login_path, params: {public_key: KEY1}
    assert_redirected_to(portfolio_path)
  end

  test 'login_failure_redirection' do
    get login_path, params: {public_key: KEY1.chomp('4OO')}
    assert_redirected_to(root_path)
  end

  test 'logout_success_redirection' do
    get login_path, params: {public_key: KEY1}
    get logout_path
    assert_redirected_to(root_path)
  end

  test 'valid_stellar_public_key_logic' do
    sample_key = KEY1
    assert_nothing_raised do
      Stellar::KeyPair.from_address(sample_key)
    end
  end

  test 'still_fetching_balances_redirection' do
    get login_path, params: {public_key: KEY1}
    get portfolio_path
    get send_money_path
    assert_redirected_to(fetching_balances_path)
  end

  test 'new_account_rendered' do
    get new_account_path
    assert_template :new_account
  end
end
