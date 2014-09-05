class Homework

  attr_accessor :name,:status, :deadline

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

  def get_status()
    if status == "FEITO"
      return true 
    else 
      return false
    end
  end

end