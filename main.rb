require_relative("manager")

manager = Manager.new()

manager.add_class("EM1A")
manager.add_class("EM2A")
manager.show_classes

atual = manager.find_class("EM1A")
#atual.show_subjects

puts "\nmyHomeworks--------"
atual.add_subject("Matematica")
atual.add_subject("Matematica22")

sub = atual.find_subject("Matematica")
sub.add_homework("teste","20/12/1992")
sub.add_homework("testsasae","20/12/1992")
sub.add_homework("tdoKAsodk assae","20/12/1992")
sub.show_homeworks()


