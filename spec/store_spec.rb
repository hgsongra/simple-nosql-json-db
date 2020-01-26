require "minitest/autorun"
require "./lib/store"
include CustomStorage

class TestStore < Minitest::Test

  def setup
    file_name = 'test-data'
    File.delete("./file/#{file_name}.json") if File.exist?("./file/#{file_name}.json")
    @store = Store.new(file_name)   
  end

  def test_nstance_of_store
    assert_equal @store.class, CustomStorage::Store
  end

  def test_initial_value_of_iteams
    assert_equal @store.items, []
    assert_equal @store.items.count, 0
  end

  def test_add_record
    @store.add(["name=hitesh", "location=bangalore"])
    assert_operator @store.items.count, :>, 0
  end

  def test_delete_record
    @store.add(["name=hitesh", "location=bangalore"])
    @store.add(["name=songra", "location=jpnagar"])
    assert_equal @store.items.count, 2
    @store.delete(["name=hitesh"])
    assert_equal @store.items.count, 1
  end

  def test_find_record
    @store.add(["name=hitesh", "location=bangalore"])
    @store.add(["name=songra", "location=jpnagar"])
    assert_equal @store.items.count, 2
    cnt = @store.find(["hitesh"])
    assert_equal cnt, 1
  end

  def test_find_record_with_fields
    @store.add(["name=hitesh", "location=bangalore"])
    @store.add(["name=hitesh", "age=29", "location=bangalore"])
    @store.add(["name=songra", "location=jpnagar", ])
    assert_equal @store.items.count, 3
    cnt = @store.find(["hitesh", "fields=name,age"])
    assert_equal cnt, 2
  end

end