
module Simple
  def go
    m = Simple::method(:escribe)
    p m
  end

  def escribe
    put "hola!"
  end
end

go

