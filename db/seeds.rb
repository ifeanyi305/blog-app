# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create(name: "Ifeanyi", photo: "https://avatars.githubusercontent.com/u/105528809?v=4", bio: "Software engineer")
laura  = User.create(name: "laura", photo: "https://avatars.githubusercontent.com/u/105006208?v=4", bio:"software engineer")
second_user = User.create(name: "joseph", photo: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80", bio: "graphics designer")
first_post = Post.create(author: user1, title: 'Hello', text: 'This is my first post')
second_post = Post.create(author: user1, title: 'hi', text: 'This is my second post')
third_post = Post.create(author: user1, title: 'okay', text: 'This is my third post')
fourth_post = Post.create(author: user1, title: 'yah', text: 'This is my fourth post')
fifth_post = Post.create(author: user1, title: 'bro', text: 'This is my fifth post')
Comment.create(post: first_post, author: user1, text: 'Hi Tom!' )
Comment.create(post: first_post, author: user1, text: 'Hi Tom!' )
Comment.create(post: first_post, author: user1, text: 'Hi Tom!' )
Comment.create(post: first_post, author: user1, text: 'Hi Tom!' )
Comment.create(post: first_post, author: user1, text: 'Hi Tom!' )
Comment.create(post: first_post, author: user1, text: 'Hi Tom!' )
