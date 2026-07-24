# Course Enrollment System

A small course-enrollment project built in five parts: a relational
database, a Java core-logic layer (enroll / waitlist / cancel), a React
frontend, a debugging exercise, and a short write-up.

```
my-app/
├── Part A. Database and SQL/
│   └── schema.sql              CREATE TABLEs, sample data, required queries
├── Part B.Core Logic/
│   ├── bin/                    compiled .class output (safe to delete/rebuild)
│   └── src/                    Java source — Student, Course, EnrollmentManager,
│                                EnrollmentSystem(Main)
├── Part C. Simple Frontend/
│   ├── public/
│   └── src/
│       ├── App.js              course table + enroll form + messages
│       ├── App.css
│       ├── index.js
│       └── ...                 (standard Create React App scaffold)
├── Part D.Debug This/
│   └── debug.md                 broken snippet, fix, and explanation
└── Part E. Short Writeup/
    └── NOTES.md                reflection on the assignment
```

## Part A — Database & SQL

`Part A. Database and SQL/schema.sql` contains:

- `CREATE TABLE` statements for `students`, `courses`, and `enrollments`
  (with primary/foreign keys and a constraint preventing a student from
  enrolling in the same course twice)
- Sample data: 8 students, 4 courses, 15 enrollment records
- The four required queries: full-capacity courses, students enrolled in
  more than 2 courses, per-course seat counts, and students with no
  enrollments

To run it locally with SQLite:

```bash
sqlite3 enrollment.db < "Part A. Database and SQL/schema.sql"
sqlite3 enrollment.db "SELECT * FROM enrollments;"
```

(Any SQL engine works — adjust the `AUTOINCREMENT`/`SERIAL` syntax if you're
using PostgreSQL/MySQL instead of SQLite.)

## Part B — Core Logic (Java)

`Part B.Core Logic/src` contains the Java classes implementing:

- `enrollStudent(studentId, courseId)` — enrolls the student, or waitlists
  them if the course is full, or returns a clear "already enrolled" message
  without crashing
- `cancelEnrollment(studentId, courseId)` — cancels a seat and automatically
  promotes the first student on that course's waitlist (FIFO)
- A console log line for every action: enrolled / waitlisted / already
  enrolled / cancelled / promoted from waitlist

To compile and run from the project root:

```bash
cd "Part B.Core Logic/src"
javac *.java -d ../bin
java -cp ../bin Main
```

(Replace `Main` with your actual entry-point class name if it differs.)

## Part C — Frontend (React)

`Part C. Simple Frontend` is a Create React App project that:

- Displays a table of all courses with name, capacity, and current
  enrollment count
- Provides a form (dropdowns) to enroll a student in a course
- Shows a friendly "Course full — added to waitlist" message instead of
  failing silently, using the same enroll/waitlist rules as Part B
- Runs entirely on mock/hardcoded data — no backend connection required

To run it locally:

```bash
cd "Part C. Simple Frontend"
npm install
npm start
```

Then open [http://localhost:3000](http://localhost:3000).

## Part D — Debug This

See `Part D.Debug This/debug.md` for the broken `has_available_seats`
snippet, the corrected version, and an explanation of what was wrong.

## Part E — Short Write-up

See `Part E. Short Writeup/NOTES.md` for the reflection on the trickiest
part of the assignment, what I'd improve with more time, and how AI tools
were used.

## Tech stack

- **Database:** SQL (SQLite-compatible)
- **Core logic:** Java
- **Frontend:** React (Create React App)
