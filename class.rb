require_relative("subject")

class Class

  attr_accessor :name

  def initialize (name)
    @name = name
    @subjects = []
    @max_sub_name = 0
  end

  def add_subject(name)
    @subjects.insert(@subjects.length, Subject.new(name))
    if @max_sub_name < name.length
      @max_sub_name = name.length
    end
  end

  def del_subject (name)
    sub = find_subject(name)
    if sub != nil
      @subjects.delete(sub)
      puts "\n Disciplina excluida com sucesso! \n"
    else
      puts "\n This subject does not exist for this class." 
    end
  end

  def find_subject(name)
    @subjects.each do |s|
      if name.eql? s.name
        return s
      end
    end

    return nil  
  end

  def show_subjects()
    system("clear")
    puts "\nDisciplinas da turma: #{@name} "
    puts "--------------------------------------"
    @subjects.each do |sub|
      print sub.name
      for i in 0..((@max_sub_name - sub.name.length)+4) do
        print " "
      end
      puts " | "
    end
  end


end