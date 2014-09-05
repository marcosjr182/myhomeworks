require_relative("manager")

@manager = Manager.new()
@this_class = nil

def show_homeworks(subject)
  
  name = ""
  subject.show_homeworks
  puts "\nEscolha uma ação: "
  puts "1 - Mudar Status "
  puts "2 - Excluir tarefa "
  puts "0 - Sair"
  op = gets.chomp.to_i

  if op == 1 || op == 2
    exists = false
    
    while !exists do
      puts "Digite o nome da matéria desejada:"
      name = gets.chomp
      if subject.find_homework(name) != nil 
        exists = true
      end
    end
  end

  if op == 1
    hw = subject.find_homework(name)
    hw.set_status(!hw.get_status)
    show_homeworks(subject)
  elsif op == 2 
    subject.del_homework(name)
    enter_subject(@this_class, subject)
  end

  enter_subject(@this_class, subject)
end

def add_homework(subject)

  # ask the homework name
  name = ""
  loop do
    puts "Digite o nome da tarefa:"
    name = gets.chomp

    s = subject.find_homework(name)
    s == nil ? exists = false : exists = true
    
    break if exists == false  
  end

  #ask the homework deadline DD/MM/YYYY
  date = ""
  loop do
    puts "Digite a data limite da tarefa (Use o formato DD/MM/AAAA):  "
    date = gets.chomp

    break if date.length == 10 && date[2] == "/" && date[5] == "/"
  end
  
  subject.add_homework(name, date)
  enter_subject(@this_class, subject)
end

def enter_subject(this_class, subject)
  @this_class = this_class
  system("clear")
  puts "Você está na matéria: #{subject.name}"
  puts "--------------------------------------------"
  puts "Escolha uma ação: "
  puts "1 - Criar tarefa"
  puts "2 - Listar tarefas"
  puts "3 - Editar nome da matéria "
  puts "4 - Excluir esta matéria"
  puts "0 - Sair"
  op = gets.chomp.to_i

  if op == 1 
    add_homework(subject)
  elsif op == 2
    show_homeworks(subject)
  elsif op == 3
    puts "Digite um novo nome para a matéria:"
    name = gets.chomp
    subject.name = name
    enter_subject(this_class, subject)
  elsif op == 4
    this_class.del_subject(subject.name)
    return nil
  end

  return nil
end

def show_subjects(this_class)
  
  this_class.show_subjects
  puts "\nEscolha uma ação: "
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
    
    enter_subject(this_class, this_class.find_subject(name))
  end

  enter_class(this_class.name)
end

def add_subject(this_class)

  loop do
    puts "Digite o nome da matéria:"
    name = gets.chomp

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
  puts "Escolha uma ação: "
  puts "1 - Criar matéria"
  puts "2 - Listar matérias"
  puts "3 - Editar nome da turma "
  puts "4 - Excluir esta Turma"
  puts "0 - Sair"
  op = gets.chomp.to_i

  if op == 1 
    add_subject(this_class)
  elsif op == 2
    show_subjects(this_class)
  elsif op == 3
    puts "Digite um novo nome para a turma:"
    name = gets.chomp
    this_class.name = name
    enter_class(name)
  elsif op == 4
    @manager.del_class(name)
    return nil
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

# Exemplos 
@manager.add_class("1B")
@manager.add_class("2A")


c = @manager.find_class("1B")
c.add_subject("Portugues")
s = c.find_subject("Portugues")
s.add_homework("Aprender a escrever", "12/12/2012")
s.add_homework("Aprender a ler", "12/12/2011")

c.add_subject("Quimica")
s = c.find_subject("Quimica")
s.add_homework("Decorar a tabela periodica", "12/12/2890")

c = @manager.find_class("2A")
c.add_subject("Jogos")
s = c.find_subject("Jogos")
s.add_homework("Zerar o GTA", "12/12/2120")
s.add_homework("Zerar o Minecraft", "12/12/2000")


call_menu
