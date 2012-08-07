sunspot_mongoid
====

A Sunspot wrapper for Mongoid. Currently supports versions: 2.x, 3.0.x and 3.1.x

Install
----

    gem install sunspot_mongoid

Examples
----

    class Post
      include Mongoid::Document
      field :title

      include Sunspot::Mongoid
      searchable do
        text :title
      end
    end

For Rails3
----

### as gem:

add a gem to Gemfile as following,

    gem 'sunspot_mongoid'

### as plugin:

add gems to Gemfile as following,

    gem 'sunspot'
    gem 'sunspot_rails'

and install sunspot_mongoid as rails plugin,

    rails plugin install git://github.com/jugyo/sunspot_mongoid.git

Rake task
----

Reindex all solr models that are located in your application's models directory.

    $ rake sunspot:reindex                # reindex all models
    $ rake sunspot:reindex[,Post]         # reindex only the Post model
    $ rake sunspot:reindex[,Post+Author]  # reindex Post and Author model


Links
----

* [sunspot](https://github.com/sunspot/sunspot)

Includes the 'sunspot_rails' gem

Copyright
----

Copyright (c) 2010 jugyo. See LICENSE for details.
