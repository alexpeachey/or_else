class Array
  def to_option
    if self.all? { |val| Maybe(val).present? }
      Maybe(self.map { |val| Maybe(val).or_else {} })
    else
      Nothing
    end
  end
end
