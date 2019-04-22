@students = []
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
file.close
end
def try_load_students
  filename = ARGV.first   #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename) #if it exists
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else     #if it doesn't exists
    puts "Sorry, #{filename} doesn't exist."
    exit #quit the program
  end
end
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort}
  end
  file.close
end
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end
def process(selection)
  case selection
  when "1"
    @students = input_students
  when "2"
    print_header
    print_students_list
    print_footer
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
    end
  end
def show_students
  print_header
  print_students_list
  print_footer
end
def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
name = STDIN.gets.chomp
  puts "Please enter the cohort"
cohort_prompt = STDIN.gets.chomp
 while !name.empty? do
   @students << {name: name, cohort: cohort_prompt}
   if @students.length == 1
     puts "Now we have #{@students.count} student"
     else
       puts "Now we have #{@students.count} students"
     end
   puts "Please enter the name of the student"
   name = STDIN.gets.chomp
   puts "Please enter the cohort"
   cohort_prompt = STDIN.gets.chomp
 end
@students.sort_by {|sym| sym[:cohort]}
end
def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end
def print_students_list
@students.each_with_index do |student, index|
  indexplusone = index + 1
  puts "#{indexplusone}. #{student[:name]} (#{student[:cohort]} cohort)".center(30)
end
end
def print_footer
  puts "--------------------------------"
  puts "Overall, we have #{@students.count} great students."
end
try_load_students      #loads the list from the start
interactive_menu
