Convert the first letter of each word found in content_text to uppercase, while keeping the rest of the letters lowercase.Your output should include the original text in one column and the modified text in another column.

 Query Breakdown
---------------------
1) Splits the content_text column into individual words using a space ' ' as the delimiter.

2) Runs the string_split function for each row in the table.it is splitting words "row by row" dynamically.

3) Takes the first letter of each word and converts it to uppercase.Extracts the rest of the word (from the 2nd letter onward) and converts it to lowercase.

4) Combines the uppercase first letter with the lowercase rest of the word.

5) Reassembles the modified words into a single string, separated by spaces.Groups the result so that each original text gets its formatted version.

SELECT content_text,
    string_agg(upper(left(value,1))+ lower(substring(value,2, len(value))),' ') as modified_text
FROM user_content CROSS APPLY STRING_SPLIT(content_text, ' ')
GROUP BY content_text;
