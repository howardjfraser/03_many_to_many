Person.destroy_all
MailingList.destroy_all

64.times do
  name = "#{FFaker::Name.first_name} #{FFaker::Name.last_name}"
  Person.create! name: name, job_title: FFaker::Job.title, bio: FFaker::Lorem.paragraph
end

mailing_lists = %w(Support Marketing Development Finance HR Legal Social)

mailing_lists.each do |name|
  MailingList.create! name: name, email: "#{name.downcase}@example.com"
end

@mailing_lists = MailingList.all

Person.all.each do |person|
  3.times do
    mailing_list = @mailing_lists.sample
    person.subscriptions.create mailing_list_id: mailing_list.id # uniqueness fails are ignored
  end
end
