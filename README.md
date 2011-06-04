# haml_interceptor

The haml_interceptor gem provides a Rack middleware that (essentially) acts as a compression filter on certain responses from your Rack application. Specifically, it intercepts JavaScript responses (e.g., AJAX) and processes them, converting verbose HTML into terse Haml. The server, then, ends up sending a much smaller content package down the wire to the client.

Of course, you'll need to pair this with haml.js on the client-side to re-expand the markup.

## Usage

    # config.ru

    require 'haml_inspector'

    use HamlInterceptor
    run MyRackApp

## Contributing to haml_interceptor

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Ben Scofield. See LICENSE.txt for
further details.

