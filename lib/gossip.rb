require 'csv'

class Gossip
  
attr_accessor :author, :content

  def initialize (author , content)
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
    all_gossips = []
    CSV.read("./db/gossip.csv").each_with_index do |csv_line, index|
      if index == id.to_i
        return Gossip.new(csv_line[0], csv_line[1])
      end
    end
    return nil # Return nil if no gossip is found with the given id
  end
end