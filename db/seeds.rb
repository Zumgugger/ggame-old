# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



["-", "hat Posten geholt", "hat Gruppe fotografiert", "hat Foto bemerkt", "hat spioniert", "hat sondiert", "hat Kopfgeld gesetzt", "Spionageabwehr", "hat Mine gesetzt", "hat Mine entschärft"].each {|o| Option.new(name: o).save }
