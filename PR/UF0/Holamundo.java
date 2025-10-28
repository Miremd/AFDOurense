/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package com.mycompany.holamundo;
//Importa clase scanner para leer por teclado
import java.util.Scanner;
/**
 *
 * @author ASUS
 */
// En java, el nombre de un archivo fuente debe coincidir con el nombre de la clase que contiene
public class Holamundo {
    //metodo principal dentro de la clase principal
    public static void main(String[] args) {
        //int  num1;
        //System.out.println("Hello World!");
	
        //Crear objeto para poder leer datos de teclado
        Scanner entrada  = new  Scanner(System.in);
        
        //declaracion de variables
        int num1;
        int num2;
        int resultado;
        
        //Bloque de instrucciones 
        System.out.println("Dime un numero");
        num1 = entrada.nextInt();
                
        System.out.println("Dime otro numero");
        num2 = entrada.nextInt();
        
        resultado = num1+num2;
        System.out.println("El resultado de sumar " + num1 + " y " + num2 + " es: " + resultado);
    }
}
