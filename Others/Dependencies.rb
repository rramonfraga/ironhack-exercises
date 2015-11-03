require 'pry'

module PhotoCamera
  def take_photo
    puts "Photo taken in #{@operative_system}"
  end
end

module Watch
  def print_current_time
    puts Time.now
  end
end

class Device
  attr_reader :operative_system, :inches

  def initialize operative_system, inches
    @operative_system = operative_system
    @inches = inches
  end
end

class Phone < Device
  include PhotoCamera
  include Watch

  attr_accessor :agenda

  def initialize operative_system, inches, agenda
    super operative_system, inches
    @agenda = agenda
  end

  def add_contact_to_agenda contact
    @agenda.add_contact contact
  end

  def print_contacts_from_agenda
    @agenda.print_contacts
  end

  def call_contact_to_agenda name
    contact = @agenda.get_contact name
    puts "Caling #{contact.phone}..."
  end
end

class SmartWatch < Device
  include PhotoCamera
  include Watch

  def print_current_time
    puts "**** #{Time.now} ****"
  end
end

class Laptop < Device
  include Watch

  attr_accessor :touchable

  def initialize opeartive_system, inches, touchable
    super opeartive_system, inches
    @touchable = touchable
  end
end

class Microwave
  include Watch

  def turn_on
    puts "Heating food..."
  end
end

class Contact
  attr_accessor :name, :phone

  def initialize name, phone
    @name = name
    @phone = phone
  end
end

class Agenda
  def initialize
    @contacts = []
  end

  def add_contact contact
    @contacts << contact
  end

  def print_contacts
    @contacts.each { |contact| puts "#{contact.name} - #{contact.phone}" }
  end

  def get_contact name
    contact = @contacts.find { |a| a.name == name }
  end
end

agenda = Agenda.new

p = Phone.new("Android", "7", agenda)
s = SmartWatch.new("iOs", "4")
l = Laptop.new("Windows", "15", false)
m = Microwave.new

# Duck Type
[p, s, l, m].each do |item| 
  item.print_current_time
end

=begin
contact1 = Contact.new "Lluis Arévalo", "660645047"
contact2 = Contact.new "AA Papa", "658894473"
contact3 = Contact.new "AA Mama", "630373274"
contact4 = Contact.new "Llucia Arévalo", "636810229"

p = Phone.new("Android", 10, agenda)
p.add_contact_to_agenda contact1
p.add_contact_to_agenda contact2
p.add_contact_to_agenda contact3
p.add_contact_to_agenda contact4
p.call_contact_to_agenda "Lluis Arévalo"

p.print_contacts_from_agenda
p.call_contact_to_agenda "Lluis Arévalo"

s = SmartWatch.new "iOs", 6
s.print_current_time
s.take_photo

m = Microwave.new
m.turn_on
=end