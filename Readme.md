ActiveRecord::AutoBuildAssociations
===================================

Now you never have to remember to manually call `build_address` or `comments.build` again.

Now you never have to worry about `NoMethodErrors` when you call `user.address.country`.

If you have an associated that should always be there when you need it, whether as a record that is already saved or (if it hasn't been saved yet), a newly built object, you can just add this to your model:

    class User < ActiveRecord::Base
      include ActiveRecord::AutoBuildAssociations
      auto_build_association :address
    end

This makes it so that any time you do `user.address`, if an existing associated record can't be found, it will automatically call `build_address` for you, ensuring that user.address will always be an instance of `Address` (even if a blank one), instead of sometimes being `nil`.

This can be very convenient for building forms for records with associations (using fields_for).

Note: You can't just check `user.address.nil?` to check if the user has supplied an address, because
`user.address` will *never* be nill when using `auto_build_association`. Instead you can check
`user.address.persisted?`.

Compatibility
=============

Tested with Rails 3.2.

To do
=====

* Currently it only works for has_one -- make it work for has_many and belongs_to (belongs_to kind of works but not well)
* Add tests

*Warning*: `belongs_to` doesn't work well because the parent record will try to auto-save the associated record
even if it's blank. In other words, simply checking if the associated record is presented/persisted has unwanted
**side effects**. So if you call `user.address.persisted?`, that causes the associated address to be
built, which may cause unexpected behavior/failure when you try to change the user.

License
=======

Copyright 2011-2012, Tyler Rick

This is free software, distributed under the terms of the MIT License.
