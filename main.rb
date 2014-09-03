require_relative("manager")

@manager = Manager.new()

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
    add_subject
  elsif op == 3
    show_subjects
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


call_menu







