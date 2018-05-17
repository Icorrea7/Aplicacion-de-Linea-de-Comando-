module Definicion
  class Preguntas
    attr_reader :definiciones
    def initialize
      @definiciones = {}
      cargar
    end

    def cargar
      file = IO.readlines("preguntas.txt")
      file.each do |pregunta|
        code, definicion, respuesta = pregunta.chomp.split("-")
        @definiciones[code.to_s.to_sym] = { definicion: definicion, respuesta: respuesta}
      end
    end

    def preguntar(code)
     puts  @definiciones[code.to_s.to_sym][:definicion]
    end

    def respuesta(code, respuesta)
     if @definiciones[code.to_s.to_sym][:respuesta].downcase == respuesta.downcase
       puts "¡Correcto!"
       return true
     else
       puts "Incorrecto, intenta nuevamente!"
       return false
     end
    end

    def agregar(definicion, respuesta)
      code = @definiciones.length + 1
      @definiciones[code.to_s.to_sym] = { definicion: definicion, respuesta: respuesta}
    end

  end
end
