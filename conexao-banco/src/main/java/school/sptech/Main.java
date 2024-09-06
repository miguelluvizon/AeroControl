package school.sptech;

import school.sptech.dao.DadosDao;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        Scanner buscarInt = new Scanner(System.in);
        Scanner buscarString = new Scanner(System.in);
        Scanner buscarBoolean = new Scanner(System.in);

        DadosDao dadosDao = new DadosDao();
        System.out.println("""
                +-------------------------------------------+
                |    BANCO DE DADOS CONECTADO NO JAVA       |
                +-------------------------------------------+
                |                                           |
                | 1) Mostrar média geral                    |
                | 2) Mostrar média de uma máquina           |
                |                                           |
                | 3) Sair                                   |
                +-------------------------------------------+
                """);
        Integer opcao = buscarInt.nextInt();

        if (opcao == 1) {
            dadosDao.obterDados();
        }


    }
}
