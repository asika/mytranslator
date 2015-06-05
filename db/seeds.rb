# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.where([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.where(name: 'Emanuel', city: cities.first)
Role.where(:name => "client").first_or_create
Role.where(:name => "translator").first_or_create
Role.where(:name => "admin", :privileged => true).first_or_create

Domain.where(:name => "group01").first_or_create
Domain.where(:name => "group02").first_or_create
Domain.where(:name => "group03").first_or_create
Domain.where(:name => "group04").first_or_create
Domain.where(:name => "group05").first_or_create

Language.where(:name => "cht").first_or_create
Language.where(:name => "eng").first_or_create
Language.where(:name => "chs").first_or_create
Language.where(:name => "jpn").first_or_create
Language.where(:name => "fra").first_or_create
Language.where(:name => "esp").first_or_create

QualityLevel.where(:level => 1, :name => "low").first_or_create
QualityLevel.where(:level => 2, :name => "mid").first_or_create
QualityLevel.where(:level => 3, :name => "high").first_or_create

CaseType.where(:from_language_id => Language.find_by_name("eng").id, :to_language_id => Language.find_by_name("cht").id, :unit => "word", :min_price => 1.0 ).first_or_create
CaseType.where(:from_language_id => Language.find_by_name("cht").id, :to_language_id => Language.find_by_name("eng").id, :unit => "word", :min_price => 1.0 ).first_or_create
CaseType.where(:from_language_id => Language.find_by_name("jpn").id, :to_language_id => Language.find_by_name("cht").id, :unit => "word", :min_price => 1.0 ).first_or_create
CaseType.where(:from_language_id => Language.find_by_name("cht").id, :to_language_id => Language.find_by_name("jpn").id, :unit => "word", :min_price => 1.0 ).first_or_create
