class Subject

  attr_accessor :name

  def initialize (name)
    @name = name
    @homeworks = []
  end

  def create_homework(name,deadline)
    @homeworks.insert(Homework.new(name,deadline))
  end

  def show_homeworks
    puts "\n Disciplinas da disciplina: " + @name
    @homeworks.each do |hw|
      puts hw.name
    end
  end
  
end