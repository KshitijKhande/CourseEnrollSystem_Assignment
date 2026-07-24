package ces;

class Student {
    int id;
    String name;
    String email;
    int yearOfStudy;
    
    Student() {
        this.id=00;
        this.name = "abc";
        this.email = "abc@gmail.com";
        this.yearOfStudy = 1;
    }

    Student(int id, String name, String email, int yearOfStudy) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.yearOfStudy = yearOfStudy;
    }

    @Override
    public String toString() {
        return name + " (Year " + yearOfStudy + ")";
    }
}
