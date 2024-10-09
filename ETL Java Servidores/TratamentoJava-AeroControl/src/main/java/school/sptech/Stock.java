package school.sptech;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Stock {

    @JsonProperty("ID")
    private String id;

    @JsonProperty("ramPorcentagem")
    private Double ramPorcentagem;

    @JsonProperty("ramBytes")
    private double ramBytes;

    @JsonProperty("cpuPorcentagem")
    private Double cpuPorcentagem;

    // Getters e setters
    public String getId() { return id; }
    public void setId(String id) { this.id = id; }

    public Double getRamPorcentagem() { return ramPorcentagem; }
    public void setRamPorcentagem(Double ramPorcentagem) { this.ramPorcentagem = ramPorcentagem; }

    public double getRamBytes() { return ramBytes; }
    public void setRamBytes(double ramBytes) { this.ramBytes = ramBytes; }

    public Double getCpuPorcentagem() { return cpuPorcentagem; }
    public void setCpuPorcentagem(Double cpuPorcentagem) { this.cpuPorcentagem = cpuPorcentagem; }
}
