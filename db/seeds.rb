Person.delete_all
MailingList.delete_all

64.times do
  name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  Person.create! name: name, job_title: FFaker::Job.title, bio: FFaker::Lorem.paragraph
end

%w(Support Marketing Development).each do |name|
  MailingList.create! name: name, email: "#{name.downcase}@example.com"
end
