# frozen_string_literal: true

class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  discard_on ActiveRecord::RecordNotUnique
  retry_on Net::OpenTimeout, Timeout::Error, wait: :exponentially_longer, attempts: 10
end
