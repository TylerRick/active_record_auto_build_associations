begin
  require 'active_record'
rescue LoadError
  module ActiveRecord
  end
end

module ActiveRecord::AutoBuildAssociations
  def self.version; "0.0.2"; end
end
