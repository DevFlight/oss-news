# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'faker'

def create_mock_users
    puts "Creating mock users..."
    50.times do |user_id|
        User.create({
            email: Faker::Internet.email, 
            username: Faker::Internet.username, 
            password: Faker::Internet.password(8)
        })
    end
end

def create_mock_posts
    puts "Creating mock posts..."
    100.times do |post_number|
        random_user = User.order("RANDOM()").first
        post_title = "Test post #{post_number}"
        post_url = "https://devflight.com"
        
        post = Post.create!(
            user_id: random_user.id, 
            title: post_title, 
            link: post_url
        )
        post.liked_by random_user
    end
end

def create_likes_data
    puts "Creating mock user likes..."
    250.times do |likes|
        random_user = User.order("RANDOM()").first
        random_post = Post.order("RANDOM()").first 
        random_post.liked_by random_user
    end
end

def create_comments_data
    puts "Creating mock user comments..."
    250.times do |comments|
        random_user = User.order("RANDOM()").first
        random_post = Post.order("RANDOM()").first
        
        random_post.comments.create!(
            user_id: random_user.id,
            commentable_id: random_post.id,
            parent_id: nil,
            body: Faker::Hacker.say_something_smart
        )
    end
end

def create_mock_data
    puts "Creating OSS News mock data..."
    create_mock_users
    create_mock_posts
    create_likes_data
    create_comments_data
end

create_mock_data