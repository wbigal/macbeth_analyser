class InvalidKeyError < KeyError
  def initialize()
    super('The key can not be nil or blank.')
  end
end
