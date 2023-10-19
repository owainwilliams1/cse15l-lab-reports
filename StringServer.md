```java
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;

class Handler implements URLHandler {
    // The one bit of state on the server: a number that will be manipulated by
    // various requests.
    ArrayList<String> strings = new ArrayList<String>();

    public String handleRequest(URI url) {
        if (url.getPath().equals("/add-message")) {
            String[] parameters = url.getQuery().split("=");
            if (!parameters[0].equals("s")) {
                return "Incorrect query key.";
            }

            String param = parameters[1];
            strings.add(param);

            String combined = "";
            for (int i = 0; i < strings.size(); i++) {
                combined += String.format("%d. %s\n", i + 1, strings.get(i)); 
            }

            return combined;
        }

        return "404 not found.";
    }
}

class StringServer {
    public static void main(String[] args) throws IOException {
        if(args.length == 0){
            System.out.println("Missing port number! Try any number between 1024 to 49151");
            return;
        }

        int port = Integer.parseInt(args[0]);

        Server.start(port, new Handler());
    }
}
```