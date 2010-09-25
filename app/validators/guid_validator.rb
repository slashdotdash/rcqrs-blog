class GuidValidator < ActiveModel::EachValidator
  # Validates the format of a guid like "922153ce-4ea5-11df-a044-0024e8c53397"
  def validate_each(record, attribute, value)
    Rcqrs::Guid.parse(value) unless value.blank?
  rescue ArgumentError => ex
    record.errors[attribute] << 'Invalid GUID format'
  end
end