module Helper

  def help
    puts "Commands:"
    puts "    help                                            For help"
    puts "    add key=value [key2=value2 key3=value3 ...]     Add new record"
    puts "    delete key=value                                Delete a record or records by a key-value pair"
    puts "    find value [fields=field1,field2,...]           Find all the records which contain a particular value"
    puts "    exit                                            Exit from terminal or press CTRL+^C"
  end

end