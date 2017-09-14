class Contact
  @@contacts = []

  attr_reader :first, :last_name, :job, :company, :contact_type

  def initialize (attributes)
    @first = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @job = attributes.fetch(:job)
    @company = attributes.fetch(:company)
    @contact_type = attributes.fetch(:contact_type)
  end

  def save
    @@contacts.push(self)
  end

  def self.clear
    @@contacts = []
  end

  def self.all
    @@contacts
  end
end
