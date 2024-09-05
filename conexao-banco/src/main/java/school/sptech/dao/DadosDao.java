package school.sptech.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import school.sptech.DatabaseConfiguration;

public class DadosDao {
    JdbcTemplate template;

    public DadosDao() {
        DatabaseConfiguration conexao = new DatabaseConfiguration();
        this.template = conexao.getTemplate();
    }

}
