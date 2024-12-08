package school.sptech;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

public class JsonWriter {
    public ByteArrayOutputStream writeFile(List<Map<String, Object>> stocks) throws IOException {
        // Criando um JSON em Memória:
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        ObjectMapper objectMapper = new ObjectMapper();

        // Mapeia cada Registro e Insere no JSON:
        objectMapper.writeValue(outputStream, stocks);

        // Retornando o ByteArrayOutputStream que contém o JSON gerado:
        return outputStream;
    }
}
