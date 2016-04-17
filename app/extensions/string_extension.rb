class String
  def humanize
    self.split(' ').map{ |word| word.capitalize }.join(' ')
  end
end
