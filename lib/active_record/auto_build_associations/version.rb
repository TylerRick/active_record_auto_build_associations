begin
  require 'active_record'
rescue LoadError
  module ActiveRecord
  end
end

module ActiveRecord::AutoBuildAssociations
  Version = "0.0.2"
end
