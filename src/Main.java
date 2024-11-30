import java.io.*;

public class Main {
    public static void main(String[] args) {
        try {
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            Scanner scanner = new Scanner(reader);
            Parser parser = new Parser(scanner);

            System.out.println("Enter expressions (end with semicolon ';'):");

            while (true) {
                System.out.print("> ");
                String input = reader.readLine();
                if (input == null || input.equalsIgnoreCase("exit")) break;

                // Feed input to the scanner
                scanner.yyreset(new StringReader(input));
                parser.parse();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
