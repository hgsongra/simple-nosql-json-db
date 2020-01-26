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
    end
    
    def delete(data)
      key, value = data.first.split('=')
      @items.select! {|item| item[key] != value }
      save_file
    end
    
    def find(data)
      puts "Find: #{data}!"
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