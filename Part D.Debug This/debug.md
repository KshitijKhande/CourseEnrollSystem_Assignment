--Below is a broken snippet meant to check if a course has available seats. Find the bug(s), fix it, and in 3–4 sentences explain what was wrong and why your fix works.

def has_available_seats(course):
    enrolled_count = 0
    for student in course.enrollments:
        if student.status = "waitlisted":
            enrolled_count += 1
    return enrolled_count < course.capacity

--Answer

--In the above code there are two fixes which will enable us to check if a course has availbale seats. 

--There are two separate bugs. First, if student.status = "waitlisted" uses a single =, which is the assignment operator in python , not the equality operator inside an if condition this is actually a syntax error, so the function would never even run; it needs the comparison operator ==.

--Second, a seat is occupied by a student whose status is "enrolled", not "waitlisted" ,In the condition of the above code "waitlisted" is wriiten instead of "enrolled".
--Counting "waitlisted" entries as if they were "enrolled" seats means the function reports the wrong number of  enrolled seats.
--The fix is status == "enrolled" instead, so enrolled_count actually reflects how many seats are truly filled, and comparing that to course.capacity gives a correct answer.

--The correct code snippet is:

def has_available_seats(course):
    enrolled_count = 0
    for student in course.enrollments:
        if student.status == "enrolled":
            enrolled_count += 1
    return enrolled_count < course.capacity
