package school.sptech;

import school.sptech.dao.DadosDao;
import school.sptech.dao.MediasDao;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner buscarInt = new Scanner(System.in);
        Scanner buscarString = new Scanner(System.in);
        Scanner buscarBoolean = new Scanner(System.in);

        DadosDao dadosDao = new DadosDao();
        MediasDao mediasDao = new MediasDao();

        System.out.println("""
                +-------------------------------------------+
                |    BANCO DE DADOS CONECTADO NO JAVA       |
                +-------------------------------------------+
                |                                           |
                | 1) Mostrar todos os dados                 |
                | 2) Mostar todos dados de uma máquina      |
                |                                           |
                | 4) Sair                                   |
                +-------------------------------------------+
                """);
        Integer opcao = buscarInt.nextInt();

        if (opcao == 1) {
            dadosDao.obterDados();
        } else if (opcao == 2) {
            System.out.println("Escolha o ID da máquina que deseja ver: \n");
            Integer id = buscarInt.nextInt();
        } else if (opcao == 3) {

        }


    }
}
