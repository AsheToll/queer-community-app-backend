# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Location.destroy_all
Event.destroy_all
EventCreator.destroy_all
EventAttendee.destroy_all
Friendship.destroy_all
Category.destroy_all
CategoryEvent.destroy_all

ashley = User.create(name: 'Ashley', username: 'ashley', password: 'password')
jamie = User.create(name: 'Jamie', username: 'jamie', password: 'nerd')
jenna = User.create(name: 'Jenna', username: 'jenna', password: 'kittens')

location_1 = Location.create(name: 'Adams Morgan')
location_2 = Location.create(name: 'Anacostia')
location_3 = Location.create(name: 'Brookland')
location_4 = Location.create(name: 'Capitol Hill')
location_5 = Location.create(name: 'Capitol Riverfront')
location_6 = Location.create(name: 'Columbia Heights')
location_7 = Location.create(name: 'Congress Heights')
location_8 = Location.create(name: 'Downtown')
location_9 = Location.create(name: 'Dupont Circle')
location_10 = Location.create(name: 'Foggy Bottom')
location_11 = Location.create(name: 'Georgetown')
location_12 = Location.create(name: 'H Street NE')
location_13 = Location.create(name: 'Ivy City')
location_14 = Location.create(name: 'Logan Circle')
location_15 = Location.create(name: 'Maryland')
location_16 = Location.create(name: 'Mount Vernon Square')
location_17 = Location.create(name: 'National Mall')
location_18 = Location.create(name: 'NoMa')
location_19 = Location.create(name: 'Penn Quarter & Chinatown')
location_20 = Location.create(name: 'Petworth')
location_21 = Location.create(name: 'Shaw')
location_22 = Location.create(name: 'Southwest & The Wharf')
location_23 = Location.create(name: 'U Street')
location_24 = Location.create(name: 'Upper Northwest')
location_25 = Location.create(name: 'Virginia')
location_26 = Location.create(name: 'Woodley Park')

event_1 = Event.create(name: 'Pumpkin Picking', image: 'https://images.unsplash.com/photo-1567877163288-afa41ad24d8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80', location_id: location_25.id, description: 'IT\'S FALL, TIME TO PICK PUMPKINS')
event_2 = Event.create(name: 'Community Potluck!', image: 'https://images.unsplash.com/photo-1547573854-74d2a71d0826?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80', location_id: location_6.id, description: 'Feel free to bring your friends and whatever dish you\'d like! Follow the link to the Excel spreadsheet if you\'re able to bring anything on the list/let us know how many +1\'s are coming to plan accordingly! Can\'t wait to see you all there!')
event_3 = Event.create(name: 'Weekly Board Game Night', image: 'https://cdn.arstechnica.net/wp-content/uploads/2016/07/IMG_3979.jpg', location_id: location_3.id, description: 'Come join us at our weekly board game night! Food will be provided, but feel free to bring snacks/drinks/dessert, and your favorite board game! Here are some of our favorites below: ')
event_4 = Event.create(name: 'Pitchers', image: 'Image of Pitchers', location_id: location_1.id, description: 'Come one, Come all! Just a night out at Pitchers/ALOHO for fun, drinks, video games, and dancing!')
event_5 = Event.create(name: 'Kickball', image: 'https://skdc.info/wp-content/uploads/2018/08/SKDC-Logo-288x300.jpg', location_id: location_9.id, description: 'Join our kickball league! Registration is still open.')

event_1_creator = EventCreator.create(creator_id: ashley.id, event_id: event_1.id)
event_2_creator = EventCreator.create(creator_id: jamie.id, event_id: event_2.id)
event_3_creator = EventCreator.create(creator_id: jenna.id, event_id: event_3.id)
# Event Attendees
event_1_attendee_1 = EventAttendee.create(attendee_id: jamie.id, event_id: event_1.id)
event_1_attendee_2 = EventAttendee.create(attendee_id: jenna.id, event_id: event_1.id)

event_2_attendee_1 = EventAttendee.create(attendee_id: jenna.id, event_id: event_2.id)
event_2_attendee_2 = EventAttendee.create(attendee_id: ashley.id, event_id: event_2.id)

event_3_attendee_1 = EventAttendee.create(attendee_id: ashley.id, event_id: event_3.id)
event_3_attendee_2 = EventAttendee.create(attendee_id: jamie.id, event_id: event_3.id)
# Friendships
ashley_jamie = Friendship.create(user_id: ashley.id, friend_id: jamie.id)
jamie_ashley = Friendship.create(user_id: jamie.id, friend_id: ashley.id)
ashley_jenna = Friendship.create(user_id: ashley.id, friend_id: jenna.id)
jenna_ashley = Friendship.create(user_id: jenna.id, friend_id: ashley.id)
jamie_jenna = Friendship.create(user_id: jamie.id, friend_id: jenna.id)
jenna_jamie = Friendship.create(user_id: jenna.id, friend_id: jamie.id)

category1 = Category.create(name: 'Fall')
category2 = Category.create(name: 'Autumn')
category3 = Category.create(name: 'Winter')
category4 = Category.create(name: 'Spring')
category5 = Category.create(name: 'Summer')
category6 = Category.create(name: 'Outdoors')
category7 = Category.create(name: 'Day Trip')
category8 = Category.create(name: 'Local')
category9 = Category.create(name: 'Sports')
category10 = Category.create(name: 'Nerd Stuff')
category11 = Category.create(name: 'Night Out')
category12 = Category.create(name: 'Volunteer')

CategoryEvent.create(category_id: category1.id, event_id: event_1.id)
CategoryEvent.create(category_id: category2.id, event_id: event_1.id)
CategoryEvent.create(category_id: category6.id, event_id: event_1.id)
CategoryEvent.create(category_id: category5.id, event_id: event_2.id)
CategoryEvent.create(category_id: category8.id, event_id: event_2.id)
CategoryEvent.create(category_id: category10.id, event_id: event_3.id)
CategoryEvent.create(category_id: category11.id, event_id: event_4.id)
CategoryEvent.create(category_id: category8.id, event_id: event_4.id)
CategoryEvent.create(category_id: category1.id, event_id: event_5.id)
CategoryEvent.create(category_id: category6.id, event_id: event_5.id)
CategoryEvent.create(category_id: category8.id, event_id: event_5.id)
CategoryEvent.create(category_id: category9.id, event_id: event_5.id)