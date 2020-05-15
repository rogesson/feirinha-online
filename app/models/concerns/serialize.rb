module Serialize
  def serialize
    classname = self.class.to_s
    method_name = classname + 'Serializer'
    constantized = method_name.constantize
    constantized.new(self).to_hash
  end
end
