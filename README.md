AstGuidelines
=============

This is bad:

```ruby
class MyClass
  module MyModule
  end
end
```

But this is ok:

```ruby
module MyModule
  class MyClass
  end
end
```

this gem tells you it's not ok
