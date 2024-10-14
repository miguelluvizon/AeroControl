package school.sptech;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class CsvWriter {

    public ByteArrayOutputStream writeCsv(List<Stock> stocks) throws IOException {
        // Criar um CSV em memória utilizando ByteArrayOutputStream
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(outputStream, StandardCharsets.UTF_8));
        CSVPrinter csvPrinter = new CSVPrinter(writer, CSVFormat.DEFAULT.withHeader("Porcentagem de  Memória RAM", "Memória RAM em GB", "Porcentagem de CPU", "Data e Hora"));

        // Processar e escrever cada objeto no CSV
        for (Stock stock : stocks) {
            csvPrinter.printRecord(
                    stock.getRamPorcentagem(),
                    stock.getRamBytesInGB(),
                    stock.getCpuPorcentagem(),
                    stock.getFormattedTimestamp()
            );
        }

        // Fechar o CSV para garantir que todos os dados sejam escritos
        csvPrinter.flush();
        writer.close();

        // Retornar o ByteArrayOutputStream que contém o CSV gerado
        return outputStream;
    }
}