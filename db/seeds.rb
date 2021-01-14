
class Seed
  def self.start
    seed = Seed.new
    seed.generate_destinations
  end

  def generate_destinations
    dest1 = Destination.create!(
      name: Faker::Address.city,
      zip: 37650,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )
    dest2 = Destination.create!(
      name: Faker::Address.city,
      zip: 80241,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )
    dest3 = Destination.create!(
      name: Faker::Address.city,
      zip: 29210,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )
    dest3 = Destination.create!(
      name: Faker::Address.city,
      zip: 98362,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )
    dest3 = Destination.create!(
      name: Faker::Address.city,
      zip: 59802,
      description: Faker::Lorem.sentence,
      image_url: Faker::Placeholdit.image
    )

    puts "Destination #{i}: #{dest.name} created!"

    # 5.times do |i|
    #   dest = Destination.create!(
    #     name: Faker::Address.city,
    #     zip: 37650,
    #     description: Faker::Lorem.sentence,
    #     image_url: Faker::Placeholdit.image
    #   )
    #   puts "Destination #{i}: #{dest.name} created!"
    # end
    # 5.times do |i|
    #   dest = Destination.create!(
    #     name: Faker::Address.city,
    #     zip: 80005,
    #     description: Faker::Lorem.sentence,
    #     image_url: Faker::Placeholdit.image
    #   )
    end
  end

Seed.start
