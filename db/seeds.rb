# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(:email => "admin@ac.com", :password => "12345678", :friendly_id => "admin")

CaseType.create(:name => "case_type.e2c", :unit => "case_type.unit.word", :min_price => 0.7)
CaseType.create(:name => "case_type.c2e", :unit => "case_type.unit.word", :min_price => 0.7)

Domain.create(:name => "domain.group01")
Domain.create(:name => "domain.group02")
Domain.create(:name => "domain.group03")
Domain.create(:name => "domain.group04")

Language.create(:name => "language.eng")
Language.create(:name => "language.cht")
Language.create(:name => "language.chs")
Language.create(:name => "language.jpn")
Language.create(:name => "language.fra")
Language.create(:name => "language.esp")