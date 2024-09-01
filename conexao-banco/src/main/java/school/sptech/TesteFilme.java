package school.sptech;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class TesteFilme {
    public static void main(String[] args) {
        Conexao conexao = new Conexao();
        JdbcTemplate con = conexao.getConexaoDoBanco();

        //.execute para criar tabelas
        //.update para inserts, updates e deletes
        //.query para selects

        con.execute("""
        create table if not exists filme (
            id int primary key auto_increment,
            nome varchar(100),
            ano_lancamento int
        )""");

        /*con.update("""
        insert into filme (nome, ano_lancamento) values
            ('Close', 2022)
        """);*/

        List<Filme> filmesDoBanco = con.query("select * from filme", new BeanPropertyRowMapper<>(Filme.class));
        System.out.println(filmesDoBanco);

        Filme filmeNovo = new Filme();
        filmeNovo.setNome("Aftersun");
        filmeNovo.setAnoLancamento(2022);

       // con.update("insert into filme (nome, ano_lancamento) values (?, ?)", filmeNovo.getNome(), filmeNovo.getAnoLancamento());

        filmesDoBanco = con.query("select * from filme", new BeanPropertyRowMapper<>(Filme.class));
        System.out.println(filmesDoBanco);

        List<Filme> filmes = con.query("select * from filme", new BeanPropertyRowMapper<>(Filme.class));
        for (Filme filme : filmes) {
            System.out.println(filme.getNome());
        }

//        con.update("delete from filme where id = 3");

        Filme filmeDoBanco = con.queryForObject("select * from filme where id = 2", new BeanPropertyRowMapper<>(Filme.class));
        System.out.println(filmeDoBanco);
        //retorna apenas 1 valor
    }
}
