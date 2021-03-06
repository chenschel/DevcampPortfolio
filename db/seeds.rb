topics = ['Ruby on Rails', 'HSV', 'Database', 'JS', 'AI']
topics.each do |topic|
  Topic.create!(
    title: topic
  )
end

puts "#{topics.size} Topics created"

150.times do |x|
  offset = rand(Topic.count)
  topic = Topic.offset(offset).first
  Blog.create!(
    title: "My Blog Post #{x}",
    body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
    topic_id: topic.id
  )
end

puts '150 Blog Posts created'

Blog.find_each do |blog|
  days_in_past = rand(800)
  blog.created_at = blog.created_at - days_in_past.days
  blog.save!
end

puts 'manipulate created_at for blog entries'

5.times do |x|
  Skill.create!(
    title: "My Skill #{x}",
    percent_utilized: 5
  )
end

puts '5 Skills created'

9.times do |x|
  Portfolio.create!(
    title: "My Portfolio #{x+1}",
    subtitle: 'Ruby on Rails',
    body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
  )
end

puts '9 Portfolios created'

3.times do |technology|
  Portfolio.last.technologies.create!(
    name: "Technology #{technology}"
  )
end

puts '3 Technologies created'

User.create(
  [
    {
      email: 'ch+admin@sumcumo.com',
      name: 'Admin',
      password: 'password',
      role: :site_admin
    },
    {
      email: 'ch+dc1@sumcumo.com',
      name: 'Mickes Maus',
      password: 'password',
      role: :user
    },
    {
      email: 'ch+dc2@sumcumo.com',
      name: 'Minny Maus',
      password: 'password',
      role: :user
    },
    {
      email: 'ch+dc3@sumcumo.com',
      name: 'Pluto',
      password: 'password',
      role: :user
    }
  ]
)

puts 'Create one site admin and three users'
