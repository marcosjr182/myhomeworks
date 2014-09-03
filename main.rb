require_relative("manager")

@manager = Manager.new()

def show_classes
  @manager.show_classes
  puts "\n\nEscolha uma ação: "
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







