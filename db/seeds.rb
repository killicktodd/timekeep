# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Watch.create([
				{
					name: "Backup Black", 
					description: "Backup Black Lorem ipsum", 
					price_in_pence: 50000,
					style: "Black",
					gender: "Unisex",
					brand: "Swatch",
					pre_owned: "false",
          user: User.first
				},
  				{
  					name: "Classic Digital Casio", 
  					description: "Casio Lorem ipsum", 
  					price_in_pence: 4999,
  					style: "Silver with yellow face",
					gender: "Unisex",
					brand: "Casio",
					pre_owned: "false",
          user: User.first
  				},
  				{
  					name: "1960s Vintage Raketa", 
  					description: "1960s Lorem ipsum", 
  					price_in_pence: 12000,
  					style: "Retro",
					gender: "Unisex",
					brand: "Raketa",
					pre_owned: "true",
          user: User.first
  				},
  				{
  					name: "Max Bill Chronoscope", 
  					description: "Max Bill Lorem ipsum", 
  					price_in_pence: 200000,
  					style: "White face",
					gender: "Unisex",
					brand: "Junghans",
					pre_owned: "false",
          user: User.first
  				}
  			])