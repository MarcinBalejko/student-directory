def interactive_menu
students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
  when "1"
    students = input_students
  when "2"
    print_header
    print(students)
    print_footer(students)
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
    end
  end
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
students = []
name = gets.chomp
  puts "Please enter the cohort"
cohort_prompt = gets.chomp
 while !name.empty? do
   students << {name: name, cohort: cohort_prompt}
   if students.length == 1
     puts "Now we have #{students.count} student"
     else
       puts "Now we have #{students.count} students"
     end
   puts "Please enter the name of the student"
   name = gets.chomp
   puts "Please enter the cohort"
   cohort_prompt = gets.chomp
 end
students.sort_by {|sym| sym[:cohort]}
end
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print(students)
students.each_with_index do |student, index|
  indexplusone = index + 1
  puts "#{indexplusone}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
end
end
def print_footer(students)
  puts "--------------------------------"
  puts "Overall, we have #{students.count} great students."
end
interactive_menu
students = input_students
#if students.length != 0
print_header
print(students)
print_footer(students)
#else
#  interactive_menu
#end
