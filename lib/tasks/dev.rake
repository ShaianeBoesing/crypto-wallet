namespace :dev do
  desc "Manages development setup"
  
  task setup: :environment do
    load_task("Dropping Database")  { %x(rails db:drop) }
    load_task("Creating Database")  { %x(rails db:create) }
    load_task("Migrating Database") { %x(rails db:migrate) }
    %x(rails dev:add_mining_types)
    %x(rails dev:add_coins)
  end

  task add_coins: :environment do
    load_task("Seeding Database - Coins") { 
      coins = [
        { description: "Bitcoin",  acronym: "BTC",  url_image: "", mining_type: MiningType.first },
        { description: "Ethereum", acronym: "ETH",  url_image: "", mining_type: MiningType.first },
        { description: "Dash",     acronym: "DASH", url_image: "", mining_type: MiningType.first }
      ]
      coins.each { |coin| Coin.find_or_create_by!(coin) }
    }
  end

  task add_mining_types: :environment do
    load_task("Seeding Database - Mining Types") { 
      mining_types = [
        { description: "Proof of Work",  acronym: "PoW" },
        { description: "Proof of Stoke", acronym: "PoS" },
        { description: "Proof of Concept", acronym: "PoC" }
      ]
      mining_types.each { |type| MiningType.find_or_create_by!(type) }
    }
  end

private

  def load_task(start_message) 
    spinner = TTY::Spinner.new("[:spinner] #{start_message}")
    spinner.auto_spin
    yield
    spinner.success('(Concluído com Sucesso)')
  end
end
