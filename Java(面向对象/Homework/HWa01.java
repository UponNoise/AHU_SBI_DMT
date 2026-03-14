import java.util.Scanner;
public class R32314015_you_a01
{
    public static void main(String[] args)
    {
        Scanner input = new Scanner(System.in);
        System.out.println("Welcome to the Student Grade Calculator!");
        System.out.print("Enter the total number of students:");
        
        int number = input.nextInt();
        input.nextLine(); //clear \n
        double Avg = 0;
        double g1, g2, g3;
        double[] gn = new double[number];
        String[] name = new String[number];
        char[] G1 = new char[number];
        int p = 0, f = 0;

        //get students
        for (int i = 0; i < number; i++)
        {
            System.out.printf("\nEnter details for student %d:\n", i+1);
            System.out.print("Name:");
            name[i] = input.nextLine();
            System.out.print("Enter Test 1 score:");
            g1 = input.nextDouble();
            System.out.print("Enter Test 2 score:");
            g2 = input.nextDouble();
            System.out.print("Enter Test 3 score:");
            g3 = input.nextDouble();
            input.nextLine(); // clear the \n
            gn[i] = (g1 + g2 + g3) / 3;
            Avg += gn[i];
        }
        Avg /= number;
        
        //get the grade and pass and fail
        for (int i = 0; i < number; i++)
        {
            char Grade = 'Z';
            if (gn[i] >= 90)
                Grade = 'A';
            else if (gn[i] >= 80)
                Grade = 'B';
            else if (gn[i] >= 70)
                Grade = 'C';
            else if (gn[i] > 60)
                Grade = 'D';
            else
                Grade = 'F';

            if (Grade != 'F')
                p++;
            else
                f++;
            G1[i] = Grade;
        }

        //print
        System.out.println("\nStudent Grades:");
        System.out.println("-------------------------------------------");
        System.out.println("Name            Average Score    Grade");
        System.out.println("-------------------------------------------");
        for (int j = 0; j < number; j++)
            System.out.printf("%-16s%-17.1f%c%n", name[j], gn[j], G1[j]);
        System.out.printf("Class Average Score:%.2f\n",Avg);
		System.out.println("Number of students passed:"+p);
		System.out.println("Number of students failed:"+f);
    input.close();
    }
}