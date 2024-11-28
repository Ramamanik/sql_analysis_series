Julia just finished conducting a coding contest, and she needs your help assembling the leaderboard! Write a query to print the respective hacker_id and name of hackers who achieved full scores for more than one challenge. Order your output in descending order by the total number of challenges in which the hacker earned a full score. If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id.

Explanation
Hacker 86870 got a score of 30 for challenge 71055 with a difficulty level of 2, so 86870 earned a full score for this challenge.
Hacker 90411 got a score of 30 for challenge 71055 with a difficulty level of 2, so 90411 earned a full score for this challenge.
Hacker 90411 got a score of 100 for challenge 66730 with a difficulty level of 6, so 90411 earned a full score for this challenge.
Only hacker 90411 managed to earn a full score for more than one challenge, so we print the their hacker_id and name as  space-separated values.

Step-by-Step Breakdown:
Tables Involved:
Hackers (H): Contains hacker_id and name for identification.
submissions (s): Tracks attempts and scores per hacker_id.
challenges (c): Links submissions to challenge difficulty levels.
difficulty (d): Provides scoring rules for challenge difficulty.
Joins:
Inner Joins link hackers to their submissions, challenges, and corresponding difficulty levels.
Conditions:
Matches s.score (hacker's score) with d.score (expected score for the challenge difficulty).
Group By:
Groups by H.hacker_id and H.name to aggregate the results per hacker.
Having Clause:
Filters only hackers solving more than 1 challenge (HAVING COUNT(*) > 1).
Ordering:
Orders hackers by the number of challenges solved (COUNT(*) DESC), and breaks ties with H.hacker_id.

solution 
---------
select H.hacker_id,H.name from Hackers H 
    inner join submissions s 
on H.hacker_id = s.hacker_id
    inner join challenges c 
on c.challenge_id = s.challenge_id  
    inner join difficulty d
on d.difficulty_level = c.difficulty_level
    where s.score = d.score
group by H.hacker_id,H.name having count(*)>1 
    order by count(*) desc,H.hacker_id;   
