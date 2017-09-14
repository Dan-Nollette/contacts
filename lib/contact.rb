require './lib/address'

class Contact
  @@contacts = []

  attr_reader :first, :last_name, :job, :company, :contact_type, :id
  attr_accessor :address
  def initialize (attributes)
    @first = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
    @address = Person::Address.new()
    @id = @@contacts.length + 1

  end

  def save
    @@contacts.push(self)
  end

  def self.clear
    @@contacts = []
  end

  def self.find(id)
    contact_id = id.to_i()
    @@contacts.each do |contact|
      if contact.id == contact_id
        return contact
      end
    end
  end

  def self.all
    @@contacts
  end
end
