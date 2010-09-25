class PostExistsValidator < ActiveModel::EachValidator
  # Validates that the given post actually exists
  def validate_each(record, attribute, value)    
    record.errors[attribute] << "does not exist" unless PostReport.exists?(value)
  end
end