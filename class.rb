require_relative("subject")

class Class

  def initialize (code)
    @code = code
    @subjects = []
  end

  def add_subject(name)
    @subjects.insert(Subject.new(name))
  end

  def del_subject (name)
    sub = find_subject(name)
    if sub != nil
      @subjects.delete(sub)
      puts "\n Disciplina excluida com sucesso! \n"
    else
      puts "\n This subject does not exist for this class." 
  end

  def find_subject (name)
    @subjects.each do |s|
      if s.name.equals? name
        return s
      else
        return nil
      end
    end
  end

  def show_subjects
    puts "\n Disciplinas da turma: " + @name
    @subjects.each do |sub|
      puts sub.name
    end
  end

end