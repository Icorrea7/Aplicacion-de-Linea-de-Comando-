require_relative "definicion"
class Interfaz
  include Definicion
  def initialize
    @i=0
    @preguntas = Preguntas.new
  end
  def jugar
    puts "-Jugar es muy facilsolo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"
    while @i < @preguntas.definiciones.length
      code = @i+1
      @preguntas.preguntar(code)
      respuesta = gets.chomp.to_s
      @i += 1  if @preguntas.respuesta(code,respuesta)
    end
    puts "---¡Ganaste!---"
  end
  def nueva
    puts "Ingresa la definicion:"
    definicion = gets.chomp.to_s
    puts "Ingresa la respuesta:"
    respuesta = gets.chomp.to_s
    @preguntas.agregar(definicion,respuesta)
  end
end
interfaz = Interfaz.new
puts "Bienvenido a reto 5 mejorado! Para jugar pulsa 'y' o para agregar una nueva pregunta pulsa 'n'"
accion = gets.chomp.to_s
if accion == "y"
  interfaz.jugar()
else
 interfaz.nueva()
end
