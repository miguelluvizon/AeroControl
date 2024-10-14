package school.sptech;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class Mapper {
    public List<Forecast> map(InputStream inputStream) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(inputStream);
        JsonNode forecastNode = rootNode.get(0).get("forecast");
        return mapper.convertValue(forecastNode, new com.fasterxml.jackson.core.type.TypeReference<List<Forecast>>() {});
    }
}