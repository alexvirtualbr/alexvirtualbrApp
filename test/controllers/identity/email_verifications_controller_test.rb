require "test_helper"

class Identity::EmailVerificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = sign_in_as(users(:lazaro_nixon))
    @sid = @user.signed_id(purpose: @user.email, expires_in: 20.minutes)
    @sid_exp = @user.signed_id(purpose: @user.email, expires_in: 0.minutes)

    @user.update! verified: false
  end

  test "should send a verification email" do
    assert_enqueued_email_with UserMailer, :email_verify_confirmation, args: { user: @user } do
      post identity_email_verification_url
    end

    assert_redirected_to root_url
  end

  test "should verify email" do
    get edit_identity_email_verification_url(token: @sid, email: @user.email)
    assert_redirected_to root_url
  end

  test "should not verify email with expired token" do
    get edit_identity_email_verification_url(token: @sid_exp, email: @user.email)

    assert_redirected_to edit_identity_email_url
    assert_equal "That email verification link is invalid", flash[:alert]
  end

  test "should not verify email with previous token" do
    @user.update! email: "other_email@hey.com"

    get edit_identity_email_verification_url(token: @sid, email: @user.email_previously_was)

    assert_redirected_to edit_identity_email_url
    assert_equal "That email verification link is invalid", flash[:alert]
  end
end
