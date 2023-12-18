package sit.int202.jcfreview;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

public class ProblemOne {
    public static void main(String[] args) {
        Set<Student> stdSet = new HashSet<>(125,0.75f); //Default capacity 16, Load Factor 0.75
        stdSet.add(new Student(10001,"Somsri",3.25));
        stdSet.add(new Student(10002,"Somsak",3.00));
        stdSet.add(new Student(10009,"Somchai",3.26));
        stdSet.add(new Student(10007,"Somsiri",3.25));
        stdSet.add(new Student(10037,"Sirisopaphan",3.25));

        System.out.println("HashSet");
        for(Student s : stdSet){
            System.out.println(s + " -> " + s.hashCode());
        }

        Set<Student> stdSet1 = new TreeSet<>();
        stdSet1.add(new Student(10001,"Somsri",3.25));
        stdSet1.add(new Student(10002,"Somsak",3.00));
        stdSet1.add(new Student(10009,"Somchai",3.26));
        stdSet1.add(new Student(10007,"Somsiri",3.25));
        stdSet1.add(new Student(10037,"Sirisopaphan",3.25));

        System.out.println("TreeSet");
        for(Student s : stdSet1){
            System.out.println(s + " -> " + s.hashCode());
        }

        System.out.println("------ Sort by GPAX ---------");
        List<Student> stdSorted = stdSet1.stream().sorted(Student.SORT_BY_GPAX).toList();
        for(Student s : stdSorted){
            System.out.println(s + " -> " + s.hashCode());
        }

        System.out.println("------ Sort by NAME ---------");
        List<Student> stdSortedName = stdSet1.stream().sorted(Student.SORT_BY_NAME).toList();
        for(Student s : stdSortedName){
            System.out.println(s + " -> " + s.hashCode());
        }
    }
}
