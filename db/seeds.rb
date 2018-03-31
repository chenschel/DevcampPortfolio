
Topic.create!(
    [
        { title: 'Ruby Programming' },
        { title: 'Software Engeneering' }
     ]
)

puts '2 Topics created'

t1 = Topic.first
t2 = Topic.second

10.times do |x|
    Blog.create!(
        title: "My Blog Post #{x}",
        body: 'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?',
        topic_id: (x.odd? ? t1.id : t2.id)
    )
end

puts '10 Blog Posts created'

5.times do |x|
    Skill.create!(
        title: "My Skill #{x}",
        percent_utilized: 5
    )
end

puts '5 Skills created'

9.times do |x|
    Portfolio.create!(
        title: "My Portfolio #{x}",
        subtitle: 'Section 1.10.33 of "de Finibus Bonorum et Malorum", written by Cicero in 45 BC',
        body: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
        main_image: 'http://via.placeholder.com/300x150',
        thumb_image: 'http://via.placeholder.com/120x60'
    )
end

puts '9 Portfolios created'
