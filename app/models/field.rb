class Field
  include MongoMapper::EmbeddedDocument
  key :label, String
  key :api_code, String

  embedded_in :form
end