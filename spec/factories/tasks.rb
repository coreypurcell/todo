# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :task do |f|
  f.description "MyString"
  f.completed false
  f.list_id 1
end
