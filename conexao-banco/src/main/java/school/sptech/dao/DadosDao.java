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

    public String ObterDados() {
//        String sqlSelect = "SELECT avg(cpuPorcentagem), avg(memoriaPorcentagem), avg(memoriaGB)" +
//                "FROM DadoComputador";
//        Integer resultado = template.query(sqlSelect, new BeanPo);
//        System.out.println(resultado);
        return "resultado";
    }
}
