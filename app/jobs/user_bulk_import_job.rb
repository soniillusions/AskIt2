# frozen_string_literal: true

class UserBulkImportJob < ApplicationJob
  queue_as :default

  def perform(acrhive_key, initiator)
    UserBulkImportService.call acrhive_key
  rescue StandardError => e
    Admin::UserMailer.with(user: initiator, error: e).bulk_import_fail.deliver_now
  else
    Admin::UserMailer.with(user: initiator).bulk_import_done.deliver_now
  end
end
