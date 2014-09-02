require_relative("class")
require_relative("subject")
require_relative("homework")

classes = Class.new("EM1A")
puts "\nmyHomeworks--------"
classes.add_subject("Matematica")
classes.add_subject("Matematica22")

classes.show_subjects()


