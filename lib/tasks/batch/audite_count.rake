namespace :batch do
  desc "Auditで変更のあった件数を通知する"
  task audit_count: :environment do
    Audit.where()
  end
end