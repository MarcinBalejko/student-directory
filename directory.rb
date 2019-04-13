def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
students = []
name = gets.chomp
  puts "Please enter the cohort"
cohort_prompt = gets.chomp
 while !name.empty? do
   students << {name: name, cohort: cohort_prompt}
   puts "now we have #{students.count} students"
   puts "Please enter the name of the student"
   name = gets.chomp
   puts "Please enter the cohort"
   cohort_prompt = gets.chomp
 end
students
end
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
students.each_with_index do |student, index|
  indexplusone = index + 1
  puts "#{indexplusone}. #{student[:name]} (#{student[:cohort]} cohort)"
end
end
def print_footer(students)
  puts "Overall, we have #{students.count} great students."
end
students = input_students
print_header
print(students)
print_footer(students)
