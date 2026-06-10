-- Platform: DataLemur

-- Problem: Spotify-Streaming-History

-- Link: https://datalemur.com/questions/spotify-streaming-history

-- Concept: CTE, AGGREGATE FUNCTION, UNION ALL, WHERE, GROUP BY, ORDER BY.

-- Query
WITH songs AS (

    SELECT 
        user_id,
        song_id,
        count(listen_time) AS song_plays
    FROM songs_weekly
    WHERE DATE(listen_time) <= '2022-08-05'
    GROUP BY user_id, song_id
    
UNION ALL

SELECT 
    user_id,
    song_id, 
    song_plays
FROM songs_history
)


SELECT
  user_id,
  song_id, 
  SUM(song_plays) AS  song_count
FROM songs
GROUP BY user_id, song_id
ORDER BY song_count DESC;


/*
Explanation: First, I identified the requirement: calculating the total number of times each user listened to each song by combining historical and recent listening data.
The listening data was stored in two different tables, so I needed to merge them before performing the final analysis.
I created a CTE (songs) to combine both datasets into a single source.
From the songs_weekly table, I counted the number of listens for each user_id and song_id.
I filtered the weekly data to include only listens on or before 2022-08-05 to avoid counting plays outside the required period.
I grouped the weekly data by user_id and song_id to calculate the total weekly plays for each song-user combination.
Then, I used UNION ALL to append records from the songs_history table.
I chose UNION ALL because I wanted to keep all play counts from both tables without removing any records.
After combining the datasets, the CTE contained all song play information from both sources.
In the final query, I grouped the combined data again by user_id and song_id.
I used SUM(song_plays) to calculate the overall number of plays for each song by each user.
Finally, I sorted the results in descending order of total play count to show the most-played songs first.
The final result provides the total listening count for every user-song combination across both weekly and historical data sources.
*/