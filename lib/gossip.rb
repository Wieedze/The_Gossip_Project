require 'csv'

class Gossip
  
attr_accessor :author, :content

  def initialize (author , content )
    @content = content 
    @author = author 
    
  end

  def save (file_path = "db/gossip.csv")
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [@author , @content]
    end
    puts "✅ Gossip saved !"
  end

  def self.all
    all_gossips = []
      CSV.read("./db/gossip.csv").each do |csv_line|
        all_gossips << Gossip.new(csv_line[0], csv_line[1])
      end
    return all_gossips
  end

  def self.find(id)
    gossips = []
    CSV.foreach("db/gossip.csv") do |row|
      gossips<<Gossip.new(row[0],row[1])
    end
    gossips[id.to_i - 1 ]
  end
end