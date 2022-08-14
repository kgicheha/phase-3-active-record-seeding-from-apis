# Add seed data in this file
puts "Seeding spells..."
# these are the spells we want to add to the database
spells = ["acid-arrow", "animal-messenger", "calm-emotions", "charm-person"]

spells.each do |spell|

    respone = RestClient.get "https://www.dnd5eapi.co/api/spells/#{spell}"

    spell_hash = JSON.parse(respone)

    Spell.create(
        name: spell_hash["name"],
        level: spell_hash["level"],
        description: spell_hash["desc"][0]
    )
end

puts "Done seeding!"