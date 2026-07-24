package ces;

import java.util.*;

class EnrollmentManager {
    Map<Integer, Course> courses = new HashMap<>();
    Map<Integer, Student> students = new HashMap<>();

    void addCourse(Course course) {
        courses.put(course.id, course);
    }

    void addStudent(Student student) {
        students.put(student.id, student);
    }

    void enrollStudent(int studentId, int courseId) {
        Course course = courses.get(courseId);
        Student student = students.get(studentId);

        if (course == null || student == null) {
            System.out.println("Course or student not found.");
            return;
        }

        if (course.enrolledStudents.contains(student)) {
            System.out.println(student.name + " is already enrolled in " + course.name);
            return;
        }

        if (course.isFull()) {
            course.waitlist.add(student);
            System.out.println("Course " + course.name + " is full. " + student.name + " added to waitlist.");
        } else {
            course.enrolledStudents.add(student);
            System.out.println(student.name + " enrolled in " + course.name);
        }
    }

    void cancelEnrollment(int studentId, int courseId) {
        Course course = courses.get(courseId);
        Student student = students.get(studentId);

        if (course == null || student == null) {
            System.out.println("Course or student not found.");
            return;
        }

        if (course.enrolledStudents.remove(student)) {
            System.out.println(student.name + " cancelled enrollment in " + course.name);

            if (!course.waitlist.isEmpty()) {
                Student promoted = course.waitlist.poll();
                course.enrolledStudents.add(promoted);
                System.out.println(promoted.name + " promoted from waitlist to enrolled in " + course.name);
            }
        } else if (course.waitlist.remove(student)) {
            System.out.println(student.name + " removed from waitlist for " + course.name);
        } else {
            System.out.println(student.name + " was not enrolled or waitlisted in " + course.name);
        }
    }
}
