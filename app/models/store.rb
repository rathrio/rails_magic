class Store
  attr_accessor :name, :plz

  def self.all
    @all ||= []
  end

  def self.find(name)
    all.find { |store| store.name = name }
  end

  def self.add(store)
    all << store
  end

  def valid?
    !name.blank? && !plz.blank?
  end

  def save
    self.class.add self
  end

  def new_record?
    self.class.all.include? self
  end

  def delete
    self.class.all.delete self
  end
end
