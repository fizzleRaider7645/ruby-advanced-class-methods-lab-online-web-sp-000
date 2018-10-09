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
      else
      end
    end
    false
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

end
