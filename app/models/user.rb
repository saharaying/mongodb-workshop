class User
  include MongoMapper::Document

  key :email, String
  timestamps!

  many :forms, :foreign_key => :creator_id
  many :entries, :foreign_key => :creator_id

end
