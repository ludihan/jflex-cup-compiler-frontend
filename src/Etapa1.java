import java.io.*;

public class Etapa1 {
    public static void main(String[] args) {
        try {
            FileReader fileReader = new FileReader(args[0]);
            
            BufferedReader bufferedReader = new BufferedReader(fileReader);
            System.out.println("FILE:");
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                System.out.println(line);
            }
            bufferedReader.close();

            fileReader = new FileReader(args[0]);
            Scanner lexer = new Scanner(fileReader);
            System.out.println("TOKENS:");
            int token;
            while ((token = lexer.yylex()) != -1) {
                // O própio arquivo flex lida com os prints
            }
            fileReader.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
