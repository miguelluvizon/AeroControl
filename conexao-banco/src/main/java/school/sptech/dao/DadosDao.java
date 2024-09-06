package school.sptech.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import school.sptech.DatabaseConfiguration;
import school.sptech.Entity.DadosEntity;

import java.util.List;

public class DadosDao {
    private JdbcTemplate template;


    public DadosDao() {
        DatabaseConfiguration conexao = new DatabaseConfiguration();
        this.template = conexao.getConexaoDoBanco();
    }

    public void obterDados() {
        String sqlSelect = "SELECT avg(cpuPorcentagem), avg(memoriaPorcentagem), avg(memoriaGB) FROM DadoComputador";
        List<DadosEntity> resultado = template.query(sqlSelect, new BeanPropertyRowMapper<>(DadosEntity.class));

        if (resultado.isEmpty()) {
            System.out.println("Não há dados na tabela");
        } else {
            for (DadosEntity resultados : resultado) {
                System.out.println("Média %CPU: " + resultados.getAvgCpuPorcentagem());
                System.out.println("Média %RAM: " + resultados.getAvgMemoriaPorcentagem());
                System.out.println("Média RAM: " + resultados.getAvgMemoriaGB());
            }
        }
    }
}
