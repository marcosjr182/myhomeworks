require_relative("class")

class Manager

  attr_reader :classes

  def initialize()
    @classes = []
    @max_c_name = 0
  end

  def add_class(name)
    @classes.insert(@classes.length, Class.new(name))
    if @max_c_name < name.length  
      @max_c_name = name.length
    end
  end

  def find_class(name)
    @classes.each do |c|
      if name.eql? c.name
        return c      
      else
        return nil
      end
    end
  end

  def show_classes
    system("clear")
    puts "\nTurmas cadastradas:" 
    puts "--------------------------------------"
    @classes.each do |c|
      print c.name
      for i in 0..((@max_c_name - c.name.length)+4)
        print " "
      end
      puts " | "
    end
    
  end

  def del_class (name)
    c = find_class(name)
    if c != nil
      @classes.delete(c)
      puts "\n Tarefa excluida com sucesso! \n"
    else
      puts "\n Esta tarefa nao existe" 
    end
  end

end