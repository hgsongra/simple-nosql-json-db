require "readline"

LIST = ['add', 'delete', 'find', 'help', 'exit'].sort
# To auto complete command
comp = proc { |s| LIST.grep(/^#{Regexp.escape(s)}/) }
Readline.completion_append_character = " "
Readline.completion_proc = comp

while input = Readline.readline("$ ", true)
  puts input
end