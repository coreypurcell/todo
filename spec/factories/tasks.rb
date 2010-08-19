# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :task do |f|
  f.description "MyString"
  f.completed false
  f.list_id 1
  f.notes ""
  f.tag_list ""
  f.completed_on Time.now
end

Factory.define :completed_task, :parent => :task do |t|
  t.completed true
  t.completed_on Time.now
end
