require 'rspec'
require 'contact'
require 'pry'

describe("Contact") do
  describe("#first") do
    it("checks for first name value within hash named attributes") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      expect(contact1.first()).to(eq("John"))
    end
  end

  describe("#last_name") do
    it("checks for last name") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      expect(contact1.last_name()).to(eq("Doe"))
    end
  end

  describe("#job") do
    it("checks for job") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      expect(contact1.job()).to(eq("Web Developer"))
    end
  end

  describe("#company") do
    it("checks for company input") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      expect(contact1.company()).to(eq("Amazon"))
    end
  end

  describe("#contact_type") do
    it("checks for contact type info") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      expect(contact1.contact_type()).to(eq("Business"))
    end
  end
  describe("#save") do
    it("saves a contact to the @@contacts variable") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      contact2 = Contact.new({:first_name=> "Jane", :last_name=> "Doe", :job=> "Project Manager", :company=> "Google", :contact_type=> "Buddy"})
      #Contact.clear
      contact1.save
      contact2.save
      expect(Contact.all).to(eq([contact1, contact2]))
    end
  end
  describe("#clear") do
    it("clears the @@contacts class variable") do
      contact1 = Contact.new({:first_name=> "John", :last_name=> "Doe", :job=> "Web Developer", :company=> "Amazon", :contact_type=> "Business"})
      contact2 = Contact.new({:first_name=> "Jane", :last_name=> "Doe", :job=> "Project Manager", :company=> "Google", :contact_type=> "Buddy"})
      contact1.save
      contact2.save
      Contact.clear
      expect(Contact.all).to(eq([]))
    end
  end
end
