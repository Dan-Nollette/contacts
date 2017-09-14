require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contact')

get('/') do
  @alert_message = ""
  @list = Contact.all
  erb(:contacts)
end

post('/') do
  first_name = params["first_name"]
  last_name = params["last_name"]
  job = params["job"]
  company = params["company"]
  contact_type = params["contact_type"]
  @alert_message = ""
  if (first_name == "" || last_name == "" || job == "" || company == "" || contact_type == "")
    @alert_message = "Please fill in all the fields :-)"
  else
    Contact.new({first_name: first_name, last_name: last_name, job: job, company: company, contact_type: contact_type}).save
  end
  @list = Contact.all
  erb(:contacts)
end

post('/clear') do
  Contact.clear
  @alert_message = ""
  @list = Contact.all
  erb(:contacts)
end
