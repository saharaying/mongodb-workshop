class Form
  include MongoMapper::Document

  key :name, String
  timestamps!
  userstamps!

  many :fields

  many :entries, :dependent => :delete_all
end
