require_relative("homework")

class Subject

  attr_accessor :name

  def initialize (name)
    @name = name
    @homeworks = []
    @max_hw_name = 0
  end

  def add_homework(name,deadline)
    @homeworks.insert(@homeworks.length, Homework.new(name,deadline))

    if @max_hw_name < name.length
      @max_hw_name = name.length
    end
  end

  def find_homework (name)
    @homeworks.each do |hw|
      if name.eql? hw.name
        return hw
      end
    end
    return nil
  end

  def show_homeworks
    system("clear")
    puts "\nTarefas da disciplina: #{@name}" 
    puts "--------------------------------------"
    @homeworks.each do |hw|
      print hw.name
      for i in 0..((@max_hw_name - hw.name.length)+4)
        print " "
      end
      print " | " + hw.status + "\n"
    end
    puts "\n\nAperte ENTER para voltar"
    gets.chomp
  end

  def del_homework (name)
    hw = find_homework(name)
    if hw != nil
      @homeworks.delete(hw)
      puts "\n Tarefa excluida com sucesso! \n"
    else
      puts "\n Esta tarefa nao existe" 
    end
  end

  
end