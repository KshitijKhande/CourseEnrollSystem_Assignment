package ces;

import java.util.*;

class Course {
    int id;
    String name;
    int capacity;
    List<Student> enrolledStudents = new ArrayList<>();
    Queue<Student> waitlist = new LinkedList<>();
    
    Course() {
        this.id = 00;
        this.name = "abc";
        this.capacity =00 ;
    }

    Course(int id, String name, int capacity) {
        this.id = id;
        this.name = name;
        this.capacity = capacity;
    }

    boolean isFull() {
        return enrolledStudents.size() >= capacity;
    }
}
