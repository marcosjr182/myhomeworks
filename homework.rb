class Homework

  attr_reader :name, :status

  def initialize (name, deadline)
    @name = name
    @deadline = deadline
    @status = "EM ESPERA"
  end

  def set_status(status)
    if status 
      @status = "FEITO"
    else 
      @status = "EM ESPERA"
    end
  end

end