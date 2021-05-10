# frozen_string_literal: true

class NonBlockedUsernameValidator < ActiveModel::Validator
  def validate(account)
    @username = account.username
    return if @username.nil?

    account.errors.add(:username, I18n.t('accounts.blocked_username')) if blocked_username?
  end

  private

  def blocked_username?
    Setting.blocked_username_words && @username.downcase.match?(/#{Setting.blocked_username_words.split(/\s*,\s*|\s+/).join('|')}/)
  end
end
