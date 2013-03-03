class Entry
  include MongoMapper::Document

  belongs_to :form
  timestamps!
  userstamps!

end