require "json"

module CustomStorage
  class Store
    
    attr_accessor :items

    def initialize
      @items = []
      set_items
    end
    
    def list
      @items.each do |item|
        puts "--", item
      end
    end

    # add fname=hitesh lname=songra about="I'm SSE" genger=male active=true
    def add(data)
      record = {}
      data.each do |field|
        key, value = field.split('=')
        record[key] = value
      end
      @items << record
      save_file
      puts "Record Saved!"
    end
    
    def delete(data)
      key, value = data.first.split('=')
      @items.select! {|item| item[key] != value }
      save_file
      puts "Record(s) deleted!"
    end
    
    def find(data)
      value = data.shift
      fields = []
      count = 0
      if !data.empty?
        cols = data.first.split('=')
        fields = cols[1].split(',') if cols.count > 1 && cols[0] == 'fields'
      end
      puts "Search result for: #{value}"
      puts "---------------------------"
      matched = @items.select {|item| item.values.include?(value)}
      if !fields.empty?
        matched.each do |match|
          selected = match.slice(*fields)
          unless selected.empty?
            puts "--", selected
            count += 1
          end
        end
      else
        matched.each do |match|
          count += 1
          puts "--", match 
        end
      end
      puts "--------------------------"
      puts "#{count} record(s) matched"
    end

    private

    def file_name
      "./file/nosql.json".freeze
    end

    def set_items
      return unless File::exists?(file_name)
      @items = JSON.load(File.read(file_name)) || []
    end
    def save_file
      File.write(file_name, @items.to_json)
    end
  end
end