require_relative 'setup'
require 'hotch'

rel = user_repo.tasks.limit(100).wrap(:user)

rel.to_a

Hotch() do
  1000.times do
    rel.each { |t| t.user.name }
  end
end
