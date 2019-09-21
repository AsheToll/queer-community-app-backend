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

ashley = User.create(name: 'Ashley', username: 'ashley')
jamie = User.create(name: 'Jamie', username: 'jamie')
jenna = User.create(name: 'Jenna', username: 'jenna')

location_1 = Location.create(name: 'Pumpkin Patch')
location_2 = Location.create(name: 'ANOTHA ONE')
location_3 = Location.create(name: 'Another Location')

event_1 = Event.create(name: 'Pumpkin Picking', image: 'https://images.unsplash.com/photo-1567877163288-afa41ad24d8c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80', location_id: location_1.id, description: 'IT\'S FALL, TIME TO PICK PUMPKINS')
event_2 = Event.create(name: 'Community Potluck!', image: 'https://images.unsplash.com/photo-1547573854-74d2a71d0826?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80', location_id: location_2.id, description: 'Feel free to bring your friends and whatever dish you\'d like!')
event_3 = Event.create(name: 'Event 3', image: 'image', location_id: location_3.id, description: 'IT\'S SUPER LIT')

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