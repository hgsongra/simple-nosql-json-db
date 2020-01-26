require "readline"
require "./lib/helper"
require "./lib/store"

include Helper
include CustomStorage

store = Store.new

LIST = ['add', 'delete', 'find', 'list', 'help', 'exit'].sort
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
    store.add(args)
  when "delete"
    next if args_missing?(args)
    store.delete(args)
  when "find"
    next if args_missing?(args)
    store.find(args)
  when "list"
    store.list
  when "help"
    help
  when "exit"
    puts "Byeeeee!"
    exit
  else
    puts "Command \"#{command}\" not found"
  end
end