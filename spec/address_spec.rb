require 'rspec'
require 'contact'
require 'address'
require 'pry'

describe("Address") do
  describe("#street_address=") do
    it ("creates a contact object, which contains an address, and then sets the street_address variable") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      contact1.address.street_address= "123 Fake Street"
      expect(contact1.address.street_address).to(eq("123 Fake Street"))
    end
  end
  describe("#city=") do
    it ("creates a contact object, which contains an address, and then sets the city variable") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      contact1.address.city= "Atlantis"
      expect(contact1.address.city).to(eq("Atlantis"))
    end
  end
  describe("#state=") do
    it ("creates a contact object, which contains an address, and then sets the state variable") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      contact1.address.state= "confusion"
      expect(contact1.address.state).to(eq("confusion"))
    end
  end
  describe("#zip=") do
    it ("creates a contact object, which contains an address, and then sets the zip variable") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      contact1.address.zip= "54321"
      expect(contact1.address.zip).to(eq("54321"))
    end
  end
end
