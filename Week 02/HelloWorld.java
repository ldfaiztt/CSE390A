import java.util.*;

public class HelloWorld {
	
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Enter your name: ");
        String username = input.nextLine();

        System.out.println("Hello, " + username);

        for (int i = 0; i < args.length; i++) {
            if (args[i].equals("-b")) {
                System.out.println("Goodbye!");
            }
        }
    }
}
