# BigQuery Analytics

## Who is this for and what does it do?
For people who want to understand how users are interacting with their products and content – specifically when these users span multiple countries, regions, socioeconomic, and demographic classes

I don't know exactly what the use-cases will be (need to see what users ask for). But roughly, I should be able to answer:
- what kind of content is doing well where
- what kind of actions is a user taking on a page
- what kind of users are consuming what kind of content

## Facts I know
- Some rows will be duplicated (i.e., more than two rows can have the same pageid)
- Some rows might not be updated by the time I finish running a query for an hour
- Cloudflare Workers cannot connect to an SQL server directly. So will have to use PostgREST instead to expose an SQL server as a REST API

## Purpose
To summarize key stats in BigQuery and save them to an SQL server, and then query the SQL server via APIs for a dashboard

## Meta Categories to add
- Referrer Meta
  - Search (Google, Bing, Duckduckgo)
  - Social (Facebook, Twitter, LinkedIn, Instagram, Pinterest, YouTube, TikTok, Snapchat)
  - Newsletters and Blogs (Substack, Blogspot, Wordpress, Tumblr)
  - Forums (Reddit, Hacker News, Quora, Stack Overflow, 4chan, HardwareZone)
  - Others
- Device Affluence

## Queries to run

### 1. Overall Statistics
- Client Id
- Time
- How many users?
- How many visits?
- How many pageviews?
- How much timespent?
- How many pageviews from Search?
- How many pageviews from Social?
- How many pageviews from Forums?
- How many pageviews from Direct?
- How many pageviews from Other sources?

### 2. Geography-based statistics for pageviews and users
- Client Id
- Time
- Country
- State
- City
- Latitude
- Longitude
- Referrer
- URL (can be null for overall)
- Users
- Sessions
- Pageviews
- Pageviews with timespent
- Timespent
- First time sessions

### 3. URL-based statistics
- Client Id
- Time
- URL Slug (can be null)
- Session Referrer
- Num pageviews
- Num pageviews with time spent
- Num unique sessions
- Num first time sessions
- Num pageviews with users active in last 24 hours
- Num pageviews with users active in last 7 days
- Num pageviews with affluence index
- Total affluence index
- Total time spent
- Last url in session count

### 4. URL read next statistics
- Client Id
- Time
- Original url (can be null if this was first hit in session)
- Next url (can be null if this was last hit in session)
- Total counts

### 5. Event Statistics
- Client Id
- Time
- URL (cannot be null)
- PageId (to ensure that all events can be tracked back to the same page)
- Event order
- Event type
- Event name
- Event value