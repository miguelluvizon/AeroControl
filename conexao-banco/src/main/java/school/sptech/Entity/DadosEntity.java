package school.sptech.Entity;

public class DadosEntity {
    private Integer idDado;
    private String horaDado;
    private Double cpuPorcentagem;
    private Double memoriaPorcentagem;
    private Integer memoriaGB;
    private Integer fkComputador;

    public Integer getIdDado() {
        return idDado;
    }

    public void setIdDado(Integer idDado) {
        this.idDado = idDado;
    }

    public String getHoraDado() {
        return horaDado;
    }

    public void setHoraDado(String horaDado) {
        this.horaDado = horaDado;
    }

    public Double getCpuPorcentagem() {
        return cpuPorcentagem;
    }

    public void setCpuPorcentagem(Double cpuPorcentagem) {
        this.cpuPorcentagem = cpuPorcentagem;
    }

    public Double getMemoriaPorcentagem() {
        return memoriaPorcentagem;
    }

    public void setMemoriaPorcentagem(Double memoriaPorcentagem) {
        this.memoriaPorcentagem = memoriaPorcentagem;
    }

    public Integer getMemoriaGB() {
        return memoriaGB;
    }

    public void setMemoriaGB(Integer memoriaGB) {
        this.memoriaGB = memoriaGB;
    }

    public Integer getFkComputador() {
        return fkComputador;
    }

    public void setFkComputador(Integer fkComputador) {
        this.fkComputador = fkComputador;
    }


}
