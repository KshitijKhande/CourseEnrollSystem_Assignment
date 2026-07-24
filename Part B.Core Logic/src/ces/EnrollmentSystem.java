package ces;

public class EnrollmentSystem {
    public static void main(String[] args) {
        EnrollmentManager manager = new EnrollmentManager();

       
        Course c1 = new Course(1, "Data Science with AIML", 3);
        Course c2 = new Course(2, "Java Full Stack", 2);
        manager.addCourse(c1);
        manager.addCourse(c2);

        
        manager.addStudent(new Student(101, "Kshitij", "kk@gmail.com", 4));
        manager.addStudent(new Student(102, "Harish", "harish@gmail.com", 3));
        manager.addStudent(new Student(103, "Diya", "diya@gmail.com", 3));
        manager.addStudent(new Student(104, "Harini", "hrn@gmail.com", 1));

        
        manager.enrollStudent(101, 1);
        manager.enrollStudent(102, 1);
        manager.enrollStudent(103, 1);
        manager.enrollStudent(104, 1); 

        manager.cancelEnrollment(102, 1);
        manager.enrollStudent(101, 1);    
    }
}
