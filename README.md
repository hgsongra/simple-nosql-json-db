Simple NoSQL JSON DB: `hql`
==========

`hql` is a simple command-line tool for `add`, `delete`, `find` or `list` the records stored in JSON file

Getting Started
----------
Clone the code anywhere and use it as long as it's full fill the below requirements:

    $ ruby -v
    2.5.1p57
    
    # Run below command from root directory
    $ bin/setup
    Doesn't matter what it's print here ;)
    .
    .
    .
    .
    .

    Finished in 0.011128s, 539.1804 runs/s, 898.6341 assertions/s.
    6 runs, 10 assertions, 0 failures, 0 errors, 0 skips
It should pass all test cases. if it's getting failed do let me know :)


You have to create an alias to save keystrokes. Run below command in root directory.

    alias hql='ruby server.rb'        # recommended for ease use
You can call any name and can change the alias name with your favorite one.

    alias pizza='ruby server.rb'        # make sure you do not use an existing alias name
Boom!, Now you can use `pizza [option] [arguments]` instead of `hql` everywhere.

Add Record `add` or `-a`
--------
For multi-word value use quotes to wrap it.

    $ hql add fname=joys lname=dove age=34 city=" New Your" about="I am an awesome person and I Love Pizza"
    Record Saved!

    # Add record with short cut `-a`
    $ hql -a fname=jon lanme=snow origin="King's Landing" age=34
    Record Saved!


List Records `list` or `-l`
----------
Prints all records stored in JSON file

    $ hql list
    --
    {"fname"=>"joys", "lname"=>"dove", "age"=>"34", "city"=>"New Your", "about"=>"I am awedome person and I Love Pizza"}
    --
    {"fname"=>"jon", "lanme"=>"snow", "origin"=>"King's Landing", "age"=>"34"}


Deleting record `delete` or `-d`
----------
Delete record by key-value pair.

    $ hql delete name=jon
    Record(s) deleted!

It'll delete all the matching records from store data, where the record contains the key name `name` and value `jon`. To verify the changes you can run `hql -l` it'll display remaining records.

Find record `find` or `-f`
----------
Use this command to search the records by value.


    $ hql -f 34
    Search result for: 34
    ---------------------------
    --
    {"fname"=>"joys", "lname"=>"dove", "age"=>"34", "city"=>"New Your", "about"=>"I am awedome person and I Love Piz
    za"}
    --
    {"fname"=>"jon", "lanme"=>"snow", "origin"=>"King's Landing", "age"=>"34"}
    --------------------------
    2 record(s) matched

It's returned all the records which contain the value `34` in any of the fields.

    $ hql -f 34 fields=fname,lname
    Search result for: 34
    ---------------------------
    --
    {"fname"=>"joys", "lname"=>"dove"}
    --
    {"fname"=>"jon"}
    --------------------------
    2 record(s) matched
Did you notice the difference? Yes, you can restrict the attributes in result set. Just like `sql` allow in `select` statement. You just have to add `fields` argument with fields of your desire in comma separeted format. eg. `fields=fname,lname,age,etc...` If field is present in record, it'll return the value else it'll simply truncate.


Help `help` or `-h`
----------
Help is just a command away.

    $ hql help

That's it.

Important
----------
All the data will save under the `file` directory in the root directory with default filename `nosql.json`. If you want to change the file name, open `server.rb` file in the root directory.

Replace the below line at 8

    `store = Store.new` to

    `store = Store.new('desire_file_name_without_any_extension')`

*NOTE*: all key names and values are case sensitive.
