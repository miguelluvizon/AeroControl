package school.sptech;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Stock {

    @JsonProperty("memoriaPorcent")
    private Double ramPorcentagem;

    @JsonProperty("memoriaByte")
    private double ramBytes;

    @JsonProperty("cpu")
    private Double cpuPorcentagem;

    @JsonProperty("timestamp")
    private LocalDateTime timestamp;

    // Getters e setters
    public Double getRamPorcentagem() { return ramPorcentagem; }
    public void setRamPorcentagem(Double ramPorcentagem) { this.ramPorcentagem = ramPorcentagem; }

    public double getRamBytes() { return ramBytes; }
    public void setRamBytes(double ramBytes) { this.ramBytes = ramBytes; }

    public Double getCpuPorcentagem() { return cpuPorcentagem; }
    public void setCpuPorcentagem(Double cpuPorcentagem) { this.cpuPorcentagem = cpuPorcentagem; }

    public LocalDateTime getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(LocalDateTime timestamp) {
        this.timestamp = timestamp;
    }

    // Método para formatar o timestamp
    public String getFormattedTimestamp() {
        if (timestamp != null) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");
            return timestamp.format(formatter);
        }
        return null; // ou retornar uma string padrão se necessário
    }

    // Método para converter bytes em gigabytes
    public String getRamBytesInGB() {
        DecimalFormat df = new DecimalFormat("#.#");
        return df.format(ramBytes / (1024 * 1024 * 1024));
    }
}
