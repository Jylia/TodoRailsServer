# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Task.create!([{name: 'First Task', isCompleted: false, isEditable: false},
	{name: 'Second Task', isCompleted: false, isEditable: false},
	{name: 'Third Task', isCompleted: true, isEditable: false},
	{name: 'Fourth Task', isCompleted: false, isEditable: false},
	{name: 'Fifth Task', isCompleted: true, isEditable: false}])
