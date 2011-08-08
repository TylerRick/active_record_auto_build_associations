ActiveRecord::AutoBuildAssociations
===================================

Now you never have to remember to manually call `build_address` or `comments.build` again.

Now you never have to worry about `NoMethodErrors` when you call `user.address.country`.

If you have an associated that should always be there when you need it, whether as a record that is already saved or (if it hasn't been saved yet), a newly built object, you can just add this to your model:

    class User < ActiveRecord::Base
      auto_build_association :address
    end

This makes it so that any time you do `user.address`, if an existing associated record can't be found, it will automatically call `build_address` for you, ensuring that user.address will always be an instance of `Address` (even if a blank one), instead of sometimes being `nil`.


To do
=====

* Currently it only works for has_one -- make it work for has_many
* Add tests

License
=======

Copyright 2011, Tyler Rick.

This is free software, distributed under the terms of the MIT License.
