require_relative("manager")

@manager = Manager.new()

def show_subjects(this_class)
  
  this_class.show_subjects
  puts "Escolha uma ação: "
  puts "1 - Entrar na matéria "
  puts "0 - Sair"
  op = gets.chomp.to_i

  if op == 1 
    exists = false
    name = ""
    
    while !exists do
      puts "Digite o nome da matéria desejada:"
      name = gets.chomp
      if this_class.find_subject(name) != nil 
        exists = true
      end
    end
    
    enter_subject(name)
  end

end

def add_subject(this_class)

  loop do
    puts "Digite o nome da matéria:"
    name = gets.chomp

    this_class.show_subjects
    puts "#{name}"
    s = this_class.find_subject(name)
    s == nil ? exists = false : exists = true
    
    this_class.add_subject(name) if s == nil

    break if exists == false  
  end
    
  enter_class(this_class.name)
end

def enter_class(name)
  this_class = @manager.find_class(name)
  system("clear")
  puts "Você está na turma: #{this_class.name}"
  puts "--------------------------------------------"
  puts "\nEscolha uma ação: "
  puts "1 - Editar nome da turma "
  puts "2 - Criar matéria"
  puts "3 - Listar matérias"
  puts "0 - Sair"
  op = gets.chomp.to_i

  if op == 1 
    puts "Digite um novo nome para a turma:"
    name = gets.chomp
    this_class.name = name
    enter_class(name)
  elsif op == 2
    add_subject(this_class)
  elsif op == 3
    show_subjects(this_class)
  end

  return nil
end

def show_classes
  @manager.show_classes
  puts "\nEscolha uma ação: "
  puts "1 - Entrar na turma "
  puts "0 - Sair"
  op = gets.chomp.to_i

  if op == 1 
    exists = false
    name = ""
    
    while !exists do
      puts "Digite o nome da turma desejada:"
      name = gets.chomp
      if @manager.find_class(name) != nil 
        exists = true
      end
    end
    
    enter_class(name)
  end

  return nil
end


def call_menu
  loop do |op|
    system("clear")
    puts("MENU ------------------")
    puts("1 - Criar Turma")
    puts("2 - Listar Turmas")
    puts("0 - SAIR")
    op = gets.chomp.to_i
    break if op == 0

    if op == 1
      puts "Digite o código da turma: "
      name = gets.chomp
      @manager.add_class(name)
    elsif op == 2 
      show_classes
    end
  end
end


