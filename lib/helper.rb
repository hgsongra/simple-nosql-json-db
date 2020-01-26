module Helper
  ARG_MISSING_ERROR = "Argument(s) missing"

  def help
    puts "Usage: hql [option] [arguments]"
    puts "    eg. hql add name=anyname age=23 location=\"JP Nagar\"  --> Will add new record"
    puts "    eg. hql -l    List all records"
    puts "Commands:"
    puts "    help                                            For help, short -h"
    puts "    add key=value [key2=value2 key3=value3 ...]     Add new record, short -a"
    puts "    delete key=value                                Delete a record or records by a key-value pair, short -d"
    puts "    find value [fields=field1,field2,...]           Find all the records which contain a particular value, short -f"
    puts "    list                                            List all the records, short -l"
  end

  def args_missing?(args) 
    if args.empty?
      puts ARG_MISSING_ERROR
      exit
    end
    false
  end

end