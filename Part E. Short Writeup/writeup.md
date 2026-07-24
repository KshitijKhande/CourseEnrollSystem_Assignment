--What was the trickiest part of this assignment for you, and how did you approach it?

The trickiest part of this assignment for me was the getting the waitlist promotion logic right in Part B especially making sure cancelling an enrollment always frees exactly
one seat and that the first waitlisted student in the waitlist is the one promoted, without accidentally creating duplicate enrollment records for the same student and course
pair. I approached it by first writing out the transitions on paper (enrolled-cancelled-waitlisted-enrolled-waitlisted-cancelled) before writing any code, then
keeping one enrollment record per (student, course) pair that gets its status updated in place, plus a separate queue per course just for waitlist ordering.



--If you had another week, what would you improve or add?

If I had another week to complete this project ,I will add database connection to the core code which will enable to fetch the data stored in the database and add new data 
entries directly into the database which will make sure they are not lost after exiting the program and can be fetche, acccesed , deleted as per requirements. I will also 
make a complete dynamic web project which will connect the databse, core logic and frontend together and provide a seamless experience to the end user.

I would add complete backend to the current project to (e.g., a small Spring Boot or Node API backed by the Part A schema) instead of using mock data, add proper validation 
and error responses, and add a few more realistic constraints like enrollment deadlines, prerequisite checks, and a limit on how many credits/courses a student can carry 
per term.

--Did you use any AI tools (ChatGPT, Copilot, Claude, etc.) during this assignment? If yes, roughly for what parts, and what did you change or add yourself?

Yes I used AI tools basically Copilot for styling my frontend page and debug writeup and in order to debug my code to make sure it was working properly especially in the 
EnrollmentManage rclass which handles the waitlist promotion part to make sure it works properly . While I reviewed and tested the SQL and Java and frontend code myself.
