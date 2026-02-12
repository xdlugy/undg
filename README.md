# UNDG
Fun project of a music forum
TDD - write tests

## TODO:
- ~~create the DB with tables~~
- Create template directories and files - create a HTML boilerplate for all twig template files
- Create routes

## Functionalities
- Song of the day/week
- Week playlist
- Music genres
- Interests
- Groups
	- Group invites
- Comments
- Add media - videos and songs
- display songs as an interactive waveform with showing length left
- Users with profiles with categories - listener, producer, rapper, musician, engineer
- User posts
- Spotify, Apple Music, Tidal, Soundcloud integration
- User statistics
- User playlists/songs, last played
- Most played playlists/songs in day/week/month/year/all time
- Event map
- Chat with Users and Groups
- Option to save playlists between streaming platforms
- Display an iframe of youtube/spotify/soundcloud when added to post content/comment
- Notifications - new chat, new friend, new reply to your comment, new group invite
- Search for Posts, Comments, Users, Groups, Genres, Artists, #hashtags

Group user type as color around the avatar
Platform user type as color around the avatar
Under avatar the position of user
Group colors (when visiting different color in background or when main page different post color)

Artists database

if user == artist (at least in one event showed in the Events page), display as Verified artist

## Views
- Login page
- Register page (with Google, Facebook or other + internal user)
- Main page - Twitter framework/design, on mobile by default Tiktok scroll with option to change default to normal scroll
	- sorting from Hot, Top, New
- Profile
	- Statistics
	- Open to work on music/beats/rap
- Groups
	- Posts
	- Comment
	- Join/Leave
- Admin pages
	- Users
	- Groups
	- Genres
	- Interests
	- Playlists
	- Events
	- Artists
- Event map
- Single event page

## Architecture
### Stack:
- Nginx
- PHP-FPM
- Symfony
- NodeJS
- Vite
- React
- Redis
- PostgreSQL
- RabbitMQ
- Elasticsearch

Written in PSR-12 with Xdebug and PHP CodeSniffer

### Simple DB table definitions

statuses
- active
- disabled
- disabled_admin
- canceled
- changed_date
- pending

users
- id
- email
- username
- description
- password (hashed)
- status (default:active, disabled_admin, disabled)
- date_created
- avatar
- type

users_positions
- user_id
- position_id

positions
- default: user
- rapper
- producer
- engineer

user_types
- administrator
- moderator
- user

integrations_definitions
- spotify
- apple music
- tidal
- soundcloud

users_integrations
- user_id
- user
- password (hashed)
- integration_id
- status (default: active, disabled)

user_playlists
- id
- user_id
- name
- description
- avatar
- url
- status (default: active, disabled_admin, disabled)

user_songs
- id
- user_id
- name
- description
- avatar
- url
- status (default: active, disabled_admin, disabled)

friends_users
- user1_id
- user2_id
- status (default: active, disabled)
- date

groups
- id
- name
- description
- avatar
- background-color (fade, array of 3)
- post-color
- status (default:active, disabled_admin, disabled)
- date_created

groups_users
- group_id
- user_id
- type
- status (default:active, disabled, removed)
- date_joined

group_user_types
- administrator
- moderator
- user

group_playlists
- id
- group_id
- name
- description
- avatar
- url
- status (default: active, disabled_admin, disabled)

group_songs
- id
- group_id
- name
- description
- avatar
- url
- status (default: active, disabled_admin, disabled)

posts
- id
- user_id
- group_id
- date_created
- date_modified
- status (default:active, disabled_admin, disabled)
- content

comments
- id
- parent_comment_id
- user_id
- date_created
- date_modified
- status (default:active, disabled_admin, disabled)
- content

interests_definitions
- id
- name
- description
- status (default:active, disabled)

interests_users
- interest_id
- user_id
- status (default:active, disabled)

genres_definitions
- id
- name
- description
- status (default:active, disabled)

genres_users
- genre_id
- user_id
- status (default:active, disabled)

playlists
- id
- name
- description
- avatar
- url
- date_created
- date_start
- date_end
- status (default:active, disabled_admin)

media
- id
- name
- description
- url
- type (image, sound, video)
- date_created
- status (default:active, disabled_admin)

chats
- id
- group_id

messages
- id
- user_id
- content
- status (default: active, disabled_admin, disabled)
- date_created
- date_modified
- parent_id (reply)

chats_users
- chat_id
- user_id
- status (default:pending, active, disabled)

chats_messages
- chat_id
- message_id

artists
- id
- name
- description
- avatar
- status

events
- id
- name
- description
- content
- avatar
- longitude
- latitude
- country
- city
- location
- date
- status (default: active, disabled_admin, canceled, changed_date)

### Symfony App Documentation

