package school.sptech.leituraescrita;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.charset.StandardCharsets;

public class LeituraDados {

    // InputStream representa um fluxo de entrada de dados byte a byte
    // Utilizamos ele para ler dados
    // InputStream não é instanciável, por isso usamos outras subclasses, como:
    // ByteArrayInputStream: leitura de dados em memória (byte[])
    // FileInputStream: leitura de dados local
    // BufferedInputStream: leitura de dados em memória usando buffer
    public static void main(String[] args) {
        try {
            InputStream inputStream = new FileInputStream("arquivo.Json");

            // BufferedReader é uma classe que ajuda a ler arquivos de texto.
            // Ele usa um buffer para armazenar os dados antes de lê-los do arquivo.
            // Ele nos permite ler strings de linha em linha.
            BufferedReader reader = new BufferedReader(
                    new InputStreamReader(inputStream, StandardCharsets.UTF_8));

            // Ao invés de implementar o InputStreamReader, podemos também utilizar o FileReader.
            // Ele é uma classe de convenção que ajuda a ler arquivos de texto.
            // FileReader fileReader = new FileReader("arquivo.txt");
            // BufferedReader reader = new BufferedReader(fileReader);


            // Iterando sobre as linhas do arquivo e imprimindo no console
            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println(line);
            }
            // Fechando o arquivo
            inputStream.close();
            reader.close();
        } catch (IOException e) {
            System.out.println("Erro ao ler arquivo: " + e.getMessage());
        }
    }

}
