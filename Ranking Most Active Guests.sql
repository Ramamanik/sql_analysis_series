Rank guests based on the total number of messages they've exchanged with any of the hosts. Guests with the same number of messages as other guests should have the same rank. Do not skip rankings if the preceding rankings are identical.Output the rank, guest id, and number of total messages they've sent. Order by the highest number of total messages first.

Query breakdown
--------------------
Step 1: Grouped guests by their ID (id_guest) and calculated the total messages they sent (SUM(n_messages)).
Step 2: Used DENSE_RANK() to assign rankings to guests, ensuring no gaps in the rank sequence for ties.
Step 3: Retrieved the ranking, guest IDs, and total messages in a neat, ranked list.

WITH grouped AS (
SELECT id_guest, SUM(n_messages) AS sum_n_messages
FROM airbnb_contacts
GROUP BY id_guest 
ORDER BY sum_n_messages DESC
),
ranked AS (
SELECT id_guest, sum_n_messages, DENSE_RANK() OVER (ORDER BY sum_n_messages DESC) AS ranking
FROM grouped
)
SELECT ranking, id_guest, sum_n_messages
FROM ranked;
