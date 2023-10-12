import java.io.IOException;
import java.net.URI;
import java.util.Map;
import java.util.ArrayList;
import java.util.HashMap;

class Handler implements URLHandler {
    ArrayList<String> items = new ArrayList<String>();

    public String handleRequest(URI url) {
        if (url.getPath().equals("/add")) {
            var query = url.getQuery();
            var map = getQueryMap(query);
            if (!map.containsKey("s")) {
                return "400 Bad Request";
            }
            items.add(map.get("s"));
            return "200 Ok";

        } else if (url.getPath().equals("/search")) {
            var query = url.getQuery();
            var map = getQueryMap(query);
            if (!map.containsKey("s")) {
                return "400 Bad Request";
            }
            var copy = (ArrayList)items.clone();
            copy.removeIf(str -> !str.toString().contains(map.get("s")));
            return String.join(", ", copy);

        } else {
            return "404 Not Found!";
        }
    }

    // https://stackoverflow.com/questions/11733500/
    // getting-url-parameter-in-java-and-extract-a-specific-text-from-that-url
    public static Map<String, String> getQueryMap(String query) {  
        String[] params = query.split("&");  
        Map<String, String> map = new HashMap<String, String>();

        for (String param : params) {  
            String name = param.split("=")[0];  
            String value = param.split("=")[1];  
            map.put(name, value);  
        }  
        return map;  
    }
}

class SearchEngine {
    public static void main(String[] args) throws IOException {
        if(args.length == 0){
            System.out.println("Missing port number! Try any number between 1024 to 49151");
            return;
        }

        int port = Integer.parseInt(args[0]);

        Server.start(port, new Handler());
    }
}
