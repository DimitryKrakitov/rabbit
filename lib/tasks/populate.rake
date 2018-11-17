namespace :populate do
  
  task users: :environment do

    (1..22).each do |i|

      User.create(
      username: "Ghoul #{i}", password: "123456", email: "ghoul#{i}@gaymail.com")
    end

  end


  task posts: :environment do

    User.all.each do |i|

      Post.create(
        user_id: i.id, title: "Post \# #{i.id}", body: "Never gonna give you up"
        )
    end

  end


  task comments: :environment do

    Post.all.each do |i|

      Comment.create(
        user_id: i.user_id, post_id: i.id, body: "Never gonna let you down"
        )
      Comment.create(
        user_id: i.user_id, post_id: i.id, body: "Never gonna run around"
        )

    end
  end


end