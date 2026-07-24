import React, { useState } from "react";
import "./App.css";

function App() {
  const [courses, setCourses] = useState({
    1: { name: "Data Science with AIML", capacity: 3, enrolled: [], waitlist: [] },
    2: { name: "Java Full Stack", capacity: 2, enrolled: [], waitlist: [] },
    3: { name: "Python with Machine Learning", capacity: 3, enrolled: [], waitlist: [] },
    4: { name: "Semiconductor Engineering", capacity: 4, enrolled: [], waitlist: [] }
  });

  const [message, setMessage] = useState("");

  const students = {
    101: "Kshitij",
    102: "Harish",
    103: "Diya",
    104: "Harini"
  };

  const [selectedStudent, setSelectedStudent] = useState("101");
  const [selectedCourse, setSelectedCourse] = useState("1");

  const enrollStudent = () => {
    let course = { ...courses[selectedCourse] };

    if (course.enrolled.includes(selectedStudent)) {
      setMessage(`${students[selectedStudent]} is already enrolled!`);
    } else if (course.enrolled.length >= course.capacity) {
      course.waitlist.push(selectedStudent);
      setMessage(`Course full — ${students[selectedStudent]} added to waitlist.`);
    } else {
      course.enrolled.push(selectedStudent);
      setMessage(`${students[selectedStudent]} enrolled successfully!`);
    }

    setCourses({ ...courses, [selectedCourse]: course });
  };

  const cancelEnrollment = () => {
    let course = { ...courses[selectedCourse] };

    if (course.enrolled.includes(selectedStudent)) {
      course.enrolled = course.enrolled.filter(s => s !== selectedStudent);
      setMessage(`${students[selectedStudent]} cancelled enrollment.`);

      if (course.waitlist.length > 0) {
        let promoted = course.waitlist.shift();
        course.enrolled.push(promoted);
        setMessage(prev => prev + ` ${students[promoted]} promoted from waitlist.`);
      }
    } else if (course.waitlist.includes(selectedStudent)) {
      course.waitlist = course.waitlist.filter(s => s !== selectedStudent);
      setMessage(`${students[selectedStudent]} removed from waitlist.`);
    } else {
      setMessage(`${students[selectedStudent]} not found in this course.`);
    }

    setCourses({ ...courses, [selectedCourse]: course });
  };

  return (
    <div className="App">
      <header>Course Enrollment System</header>

      <h2>Courses</h2>
      <table>
        <thead>
          <tr>
            <th>Course Name</th>
            <th>Capacity</th>
            <th>Enrolled</th>
            <th>Empty Seats</th>
          </tr>
        </thead>
        <tbody>
          {Object.entries(courses).map(([id, c]) => (
            <tr key={id}>
              <td>{c.name}</td>
              <td>{c.capacity}</td>
              <td>{c.enrolled.length}</td>
              <td>{c.capacity - c.enrolled.length}</td>
            </tr>
          ))}
        </tbody>
      </table>

      <h2>Manage Enrollment</h2>
      <div className="form">
        <label>Student:</label>
        <select value={selectedStudent} onChange={e => setSelectedStudent(e.target.value)}>
          {Object.entries(students).map(([id, name]) => (
            <option key={id} value={id}>{name}</option>
          ))}
        </select>

        <label>Course:</label>
        <select value={selectedCourse} onChange={e => setSelectedCourse(e.target.value)}>
          {Object.entries(courses).map(([id, c]) => (
            <option key={id} value={id}>{c.name}</option>
          ))}
        </select>

        <button onClick={enrollStudent}>Enroll</button>
        <button onClick={cancelEnrollment}>Cancel Enrollment</button>
      </div>

      <div className="message">{message}</div>
    </div>
  );
}

export default App;
