/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

import static BD.ConexionBD.abrirBase;
import Utiles.DatosGenericos;
import com.fasterxml.jackson.databind.deser.ValueInstantiators;
import java.io.*;
import java.util.Calendar;
import javax.swing.*;
import java.sql.*;
import java.sql.SQLException;
import org.javalite.activejdbc.Base;
import org.javalite.activejdbc.DB;

public class Modulo {


    java.util.Date fecha = new java.util.Date();
    private static String anio;
    private static String mes;
    private static String dia;

    public static String ConvertirFechaString(Calendar FechaCalendar) {
        String fechaString;
        Modulo.anio = Integer.toString(FechaCalendar.get(Calendar.YEAR));
        Modulo.mes = Integer.toString(FechaCalendar.get(Calendar.MONTH) + 1);
        Modulo.dia = Integer.toString(FechaCalendar.get(Calendar.DAY_OF_MONTH));
        fechaString = Modulo.dia + "/" + Modulo.mes + "/" + Modulo.anio;
        return fechaString;
    }

}
