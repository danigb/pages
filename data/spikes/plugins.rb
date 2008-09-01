
$r = {}

def add(type, er)
  $r[type] = er
end

def render(data, type)
  $r[type].call(data)
end

add(:up, lambda {|d| d.upcase})
add(:low, lambda {|d| d.downcase})



p render('Hola', :up)
p render('Hola', :low)


