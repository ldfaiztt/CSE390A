public class Backwards {
    public static void main (String[] args) {
	for (int i = 0; i < args.length; i++) {
	    String s = args[i];
	    while (s.length() > 0) {
		System.out.print(s.charAt(s.length() - 1));
		s = s.substring(0, s.length() - 1);
	    }
	    System.out.println();
	}
    }
}
