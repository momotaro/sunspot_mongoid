$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sunspot_mongoid'

test_db = 'sunspot-mongoid-test'

Mongoid.configure do |config|
  if defined?(Moped)
    config.connect_to(test_db)
  else
    config.master = Mongo::Connection.new.db(test_db)
  end
end

# model
class Post
  include Mongoid::Document
  field :title

  include Sunspot::Mongoid
  searchable do
    text :title
  end
end

# remove old indexes
Post.destroy_all

# indexing
Post.create(:title => 'foo')
Post.create(:title => 'foo bar')
Post.create(:title => 'bar baz')

# commit
Sunspot.commit

# search
search = Post.search do
  keywords 'foo'
end
search.each_hit_with_result do |hit, post|
  p post
end
