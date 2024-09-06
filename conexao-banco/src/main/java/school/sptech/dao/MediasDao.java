package school.sptech.dao;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import school.sptech.DatabaseConfiguration;
import school.sptech.Entity.MediasEntity;

import java.util.List;

public class MediasDao {
    private JdbcTemplate template;


    public MediasDao() {
        DatabaseConfiguration conexao = new DatabaseConfiguration();
        this.template = conexao.getConexaoDoBanco();
    }

    public void obterLista() {
        String sqlSelect = "SELECT avg(cpuPorcentagem) as cpuAverage, avg(memoriaPorcentagem) as memoriaAverage, avg(memoriaGB) as memoriaGBAverage FROM DadoComputador;";
        List<MediasEntity> resultadoQuery = template.query(sqlSelect, new BeanPropertyRowMapper<>(MediasEntity.class));
        for (MediasEntity medias : resultadoQuery) {
            System.out.println("MÉDIA DE USO DA CPU(%): " + medias.getCpuAverage());
            System.out.println("MÉDIA DE USO DA MEMORIA(%): " + medias.getMemoriaAverage());
            System.out.println("MÉDIA DE USO DA MEMORIA(GB): " + medias.getMemoriaGBAverage());
        }
    }
}
