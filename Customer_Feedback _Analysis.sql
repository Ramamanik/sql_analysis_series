Capital One's marketing team is working on a project to analyze customer feedback from their feedback surveys.


The team sorted the words from the feedback into three different categories;


•	short_comments
•	mid_length_comments
•	long_comments


The team wants to find comments that are not short and that come from social media. The output should include 'feedback_id,' 'feedback_text,' 'source_channel,' and a calculated category.

Table: customer_feedback

  
 breakdown of the approach:
  ------------------------
Deduplicate feedback by selecting unique entries for each feedback_id from the customer_feedback table.

Filter Out unwanted categories and channels:

Exclude feedback marked as "short_comments" using WHERE NOT.

Focus only on feedback coming from social_media.

Order Results by feedback_id to make the output organized and easy to analyze.

  
snippet
--------
with filtered_comments as
          (select distinct on( feedback_id) feedback_id,feedback_text,source_channel,comment_category from customer_feedback order by feedback_id,feedback_text,source_channel,comment_category)
          
          select * from filtered_comments where not comment_category='short_comments' and 
          source_channel='social_media'order by feedback_id ;
