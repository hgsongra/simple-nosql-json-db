require "readline"
require "./lib/helper"
require "./lib/store"

include Helper
include CustomStorage

store = Store.new

if __FILE__ == $0
  command = ARGV[0]
  args = ARGV[1..-1]
  case command
  when 'list','-l'
    store.list
  when 'add','-a'
    args_missing?(args)
    store.add(args)
  when 'delete', '-d'
    args_missing?(args)
    store.delete(args)
  when 'find', '-f'
    args_missing?(args)
    store.find(args)
  when 'help', '-h'
    help
  end
end