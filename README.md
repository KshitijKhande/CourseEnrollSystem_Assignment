# 📚 Course Enrollment System

A  assignment project demonstrating **SQL database design**, **Java backend logic**, **React frontend UI**, debugging, and reflection write‑up.

---
## 📂 Repository Structure

course-enrollment-system/
│
├── PartA-Database and SQL/               # Database schema and queries
│   ├── schema.sql
│
├── PartB-Core Logic/      # Core enrollment logic in Java
│   |── src/
|     ├── ces/
│      ├── Student.java
│      ├── Course.java
│      ├── EnrollmentManager.java
│      └── EnrollmentSystem.java
│   
│
├── PartC_React_Frontend/    # React frontend UI
│   ├── src/
│   │   ├── App.js
│   │   ├── App.css
│   │   └── index.js
│   ├── package.json
│   └── README.md
│
├── PartD.Debug This/             # Debugging exercise
│   └── debug.md
│
├── PartE. Short Writeup/           # Reflection write‑up
│   └── writeup.md
│
└── README.md                # This file

Code

---

## 🗂️ Part A — Database & SQL
- **Schema**: Students, Courses, Enrollments with constraints.
- **Sample Data**: 10 students, 4 courses, 15 enrollments.
- **Queries**:
  - Courses at full capacity.
  - Students in more than 2 courses.
  - Course enrollment + empty seats.
  - Students with no enrollments.

Run with:
```bash
mysql -u <user> -p < schema.sql

⚙️ 🗂️Part B — Java Backend
Implements enrollStudent and cancelEnrollment with rules:

Prevent duplicate enrollment.
Waitlist when full.
Promote from waitlist on cancellation.

Compile & run:

bash
cd PartB.Core Logic/src
javac *.java
java EnrollmentSystem

🌐 Part C — React Frontend
A simple UI to:

Display courses with capacity and enrollment.
Enroll or cancel students.
Show messages for full courses and waitlist promotions.

Run locally
Install Node.js (LTS).

In VS Code terminal:

bash
cd PartC.Simple Frontend
npm install
npm start
Open http://localhost:3000 (localhost in Bing) in your browser.

🐞 Part D — Debugging
Fixed Python function has_available_seats(course):

Corrected = to ==.
Count only "enrolled" students.

✍️ Part E — Write‑up
Reflection on challenges, improvements, and AI tool usage is included in NOTES.md.
