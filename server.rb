require "readline"
require "./lib/helper.rb"
include Helper


LIST = ['add', 'delete', 'find', 'help', 'exit'].sort
# To auto complete command
comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/) }
Readline.completion_append_character = " "
Readline.completion_proc = comp

help # TO display initial command help

while input = Readline.readline("$ ", true)
  
  next if input.empty?
  args = input.split(' ')
  command = args.shift&.strip&.downcase

  case command
  when "add"
    next if args_missing?(args)
    puts "inside: #{command}"
  when "delete"
    next if args_missing?(args)
    puts "inside: #{command}"
  when "find"
    next if args_missing?(args)
    puts "inside: #{command}"
  when "help"
    help
  when "exit"
    puts "Byeeeee!"
    exit
  else
    puts "Command \"#{command}\" not found"
  end
end