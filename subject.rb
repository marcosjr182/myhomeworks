require_relative("homework")

class Subject

  attr_reader :name

  def initialize (name)
    @name = name
    @homeworks = []
    @max_hw_name = 0
  end

  def add_homework(name,deadline)
    puts "passo"
    @homeworks.insert(Homework.new(name,deadline))

    if @max_hw_name < name.length
      @max_hw_name = name.length
    end
  end

  def show_homeworks
    puts "\n Tarefas da disciplina: " + @name
    @homeworks.each do |hw|
      print hw.name
      for i in 0..((@max_hw_name - hw.name.length)+4)
        print " "
      end
      print " | " + hw.status
    end
  end

  def del_homework (name)
    hw = find_subject(name)
    if hw != nil
      @homeworks.delete(hw)
      puts "\n Tarefa excluida com sucesso! \n"
    else
      puts "\n Esta tarefa nao existe" 
    end
  end

  
end