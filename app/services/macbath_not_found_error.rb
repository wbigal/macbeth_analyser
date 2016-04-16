class MacbathNotFoundError < RuntimeError
  def initialize
    super('Macbath is not found or is inaccessible.')
  end
end
