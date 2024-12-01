import java.io.*;

public class Etapa2 {
    public static void main(String[] args) {
        try {
            scanner scanner = new scanner(new FileReader(args[0]));
            parser parser = new parser(scanner);


            parser.parse();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
