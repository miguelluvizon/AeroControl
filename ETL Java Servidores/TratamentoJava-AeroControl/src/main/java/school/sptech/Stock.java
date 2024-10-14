package school.sptech;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Stock {

    @JsonProperty("memoria RAM (%)  ")
    private Double ramPorcentagem;

    @JsonProperty("memroia RAM Bytes")
    private double ramBytes;

    @JsonProperty("cpu")
    private Double cpuPorcentagem;

    // Getters e setters
    public Double getRamPorcentagem() { return ramPorcentagem; }
    public void setRamPorcentagem(Double ramPorcentagem) { this.ramPorcentagem = ramPorcentagem; }

    public double getRamBytes() { return ramBytes; }
    public void setRamBytes(double ramBytes) { this.ramBytes = ramBytes; }

    public Double getCpuPorcentagem() { return cpuPorcentagem; }
    public void setCpuPorcentagem(Double cpuPorcentagem) { this.cpuPorcentagem = cpuPorcentagem; }
}
