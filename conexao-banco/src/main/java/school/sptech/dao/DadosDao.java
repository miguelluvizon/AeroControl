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
        String sqlSelect = "SELECT * FROM DadoComputador";
        List<DadosEntity> resultado = template.query(sqlSelect, new BeanPropertyRowMapper<>(DadosEntity.class));

        if (resultado.isEmpty()) {
            System.out.println("Não há dados na tabela");
        } else {
            for (DadosEntity resultados : resultado) {
                System.out.println("---".repeat(20));
                System.out.print("  CPU % - " + (resultados.getCpuPorcentagem()));
                System.out.print(" | RAM % - " + (resultados.getMemoriaPorcentagem()));
                System.out.print(" | RAM GB - " + (resultados.getMemoriaGB()));
                System.out.println("\n");
            }
        }
    }

    public void obterDadosPorMaquina(Integer id) {
        String sqlSelect = "SELECT * FROM DadoComputador WHERE fkComputador = %d ORDER BY horadado DESC LIMIT 10".formatted(id);
        List<DadosEntity> resultado = template.query(sqlSelect, new BeanPropertyRowMapper<>(DadosEntity.class));

        if (resultado.isEmpty()) {
            System.out.println("Não há dados na tabela");
        } else {
            for (DadosEntity resultados : resultado) {
                System.out.println("---".repeat(16));
                System.out.print("  CPU % - " + (resultados.getCpuPorcentagem()));
                System.out.print(" | RAM % - " + (resultados.getMemoriaPorcentagem()));
                System.out.print(" | RAM GB - " + (resultados.getMemoriaGB()));
                System.out.println("\n");
            }
        }
    }
}
