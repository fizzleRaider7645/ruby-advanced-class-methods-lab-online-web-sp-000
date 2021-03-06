class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.create
    song = self.new
    song.save
    song
  end
  
  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end
  
  def self.new_by_name(name)
    song = self.new 
    song.name = name
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.find_by_name(search)
    @@all.find do |song|
      if song.name == search
        return song
      else
        false
      end
    end
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end
  
  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end
  
  def self.new_from_filename(filename)
    parsed = filename.split(" - ")
    
    name = parsed[0]
    title = parsed[1].split(".").take(1).first
    
    song = self.new 
    song.artist_name = name
    song.name = title 
    song 
  end
  
  def self.create_from_filename(filename)
    parsed = filename.split(" - ")
    
    name = parsed[0]
    title = parsed[1].split(".").take(1).first
    
    song = self.new 
    song.artist_name = name
    song.name = title 
    song.save 
  end
  
  def self.destroy_all
    self.all.clear
  end

end
