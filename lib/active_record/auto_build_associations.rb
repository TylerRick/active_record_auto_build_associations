module ActiveRecord
  module AutoBuildAssociations
    extend ActiveSupport::Concern

    module ClassMethods
    end

    included do
      # can be turned off from tests, for example
      cattr_accessor :auto_build_associations
      @@auto_build_associations = true
      def self.auto_build_associations?
        #puts "self.auto_build_associations? returning #{@@auto_build_associations.inspect}"
        @@auto_build_associations
      end

      def self.auto_build_association(assoc_name)
        define_method :"#{assoc_name}_with_auto_build" do
          if self.class.auto_build_associations? == false
            send(:"#{assoc_name}_without_auto_build")
          else
            send(:"#{assoc_name}_without_auto_build") || (
              # TODO: reflect on association; for has_many, it should do assoc_name.build instead
              send(:"build_#{assoc_name}")
              send(:"#{assoc_name}_without_auto_build")
            )
          end
        end
        alias_method_chain :"#{assoc_name}", :auto_build
      end

    end # included
  end
end
