(1..25).each{ |id| Project.create(name: "Project #{id}", description: "Description #{id}") }
project = Project.find(1)
(1..6).each { |id| project.entries.create(hours: 0, minutes: id, date: Time.now) }