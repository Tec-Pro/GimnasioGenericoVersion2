/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controladores;

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

    public String bd = DatosGenericos.dataBaseName; //negrada 
    public static String login = "root";
    public static String password = "root";
    public String url = "jdbc:mysql://localhost/" + bd;
    public String urlcero = "jdbc:mysql://localhost/";
    public Connection conn = null;
    public static File nombrebackup = null;
    public static File rutabackup = null;
    public static int selecGuardaBack = 0;
    public static int selecRestauraBack = 0;
    public static int conectadoMySQL = 0;
    java.util.Date fecha = new java.util.Date();
    private static String anio;
    private static String mes;
    private static String dia;
    private String installMysql = "";

    public static String ConvertirFechaString(Calendar FechaCalendar) {
        String fechaString;
        Modulo.anio = Integer.toString(FechaCalendar.get(Calendar.YEAR));
        Modulo.mes = Integer.toString(FechaCalendar.get(Calendar.MONTH) + 1);
        Modulo.dia = Integer.toString(FechaCalendar.get(Calendar.DAY_OF_MONTH));
        fechaString = Modulo.dia + "/" + Modulo.mes + "/" + Modulo.anio;
        return fechaString;
    }

    public void transfer(InputStream input, OutputStream output) throws Exception {
        byte[] buf = new byte[1024];
        int len;
        while ((len = input.read(buf)) > 0) {
            output.write(buf, 0, len);
        }
        input.close();
        output.close();
    }

    public void conectar() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, login, password);
            if (conn != null) {
                conectadoMySQL = 1;
                //   conn.close();
            }
        } catch (SQLException ex) {
            conectadoMySQL = 0;
        } catch (ClassNotFoundException ex) {
            conectadoMySQL = 0;
        }
    }

    public void conectarMySQL() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(urlcero, login, password);
            if (conn != null) {
                conectadoMySQL = 1;
                // conn.close();
            }
        } catch (SQLException ex) {
            conectadoMySQL = 0;
        } catch (ClassNotFoundException ex) {
            conectadoMySQL = 0;
        }
    }

    public void CrearBackup() {
        obtenerRutaMysql();
        if (selecGuardaBack == 1) {
            Runtime rt = Runtime.getRuntime();
            try {
                String command = installMysql + "mysqldump --opt -u " + login + " -p" + password + " -h localhost " + bd + " -r \"" + rutabackup + ".sql\"";
                //System.out.println(command);
                rt.exec(command);
                JOptionPane.showMessageDialog(null, "Backup creado exitosamente! Se cerrará el programa, debe abrirlo de nuevo");
                System.exit(1);
            } catch (IOException ex) {
                ex.printStackTrace();

            }
        } else if (selecGuardaBack == 0) {
            JOptionPane.showMessageDialog(null, "No se creo ningÃºn archivo de backup!");
        }
    }

    public void RestaurarBackup() throws InterruptedException, IOException {
        //System.out.println(DB.getCurrrentConnectionNames().size());
        DB.closeAllConnections();
        //System.out.println(DB.getCurrrentConnectionNames().size());
        Statement sentencia = null;
        if (selecRestauraBack == 1) {
            if (conn != null) {
                try {
                    conn = DriverManager.getConnection(urlcero, login, password);
                    sentencia = conn.createStatement();
                    String killProcess = "SELECT GROUP_CONCAT(CONCAT('KILL QUERY ',id,';') SEPARATOR ' ') KillQuery FROM information_schema.processlist WHERE db='" + bd + "';";
                    sentencia.setQueryTimeout(15);
                    ResultSet rs = sentencia.executeQuery(killProcess);
                    String[] kill = {};
                    while (rs.next()) {
                        kill = rs.getString(1).split("; ");
                    }
                    for (String s : kill) {
                        sentencia.execute(s + ";");
                    }
                    sentencia.close();
                    sentencia = conn.createStatement();
                    String comsSQL = "USE " + bd + ";";
                    sentencia.execute(comsSQL);
                    restaurar();
                    JOptionPane.showMessageDialog(null, "Backup creado exitosamente! Se cerrará el programa, debe abrirlo de nuevo");
                    System.exit(1);
                } catch (SQLException ex) {
                    System.err.println(ex);
                }
            }
        } else if (selecRestauraBack == 0) {
            JOptionPane.showMessageDialog(null, "No se seleccionÃ³ ningun archivo de Backup!");
        }
    }

    public void GuardarRutaBackup() {
        JFileChooser fc = new JFileChooser();
        fc.setApproveButtonText("Guardar Backup SQL");
        fc.addChoosableFileFilter(new Modulo.SQLFilter());
        fc.showSaveDialog(null);
        if (fc.getSelectedFile() != null) {
            rutabackup = fc.getSelectedFile();
            selecGuardaBack = 1;
        } else if (fc.getSelectedFile() == null) {
            selecGuardaBack = 0;
        }
    }

    public void AbrirRutaBackup() {
        JFileChooser chooser = new JFileChooser();
        chooser.setApproveButtonText("Abrir SQL");
        chooser.addChoosableFileFilter(new Modulo.SQLFilter());
        chooser.showOpenDialog(null);
        if (chooser.getSelectedFile() != null) {
            nombrebackup = chooser.getSelectedFile();
            selecRestauraBack = 1;
        } else if (chooser.getSelectedFile() == null) {
            selecRestauraBack = 0;
        }
    }

    public static class SQLFilter extends javax.swing.filechooser.FileFilter {

        final static String sql = "sql";

        public SQLFilter() {
        }

        public boolean accept(File f) {
            if (f.isDirectory()) {
                return true;
            }
            String s = f.getName();
            int i = s.lastIndexOf('.');

            if (i > 0 && i < s.length() - 1) {
                String extension = s.substring(i + 1).toLowerCase();
                if (sql.equals(extension)) {
                    return true;
                } else {
                    return false;
                }
            }
            return false;
        }

        public String getDescription() {
            return "Archivos .sql";
        }
    }

    private void obtenerRutaMysql() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection coneccionini = DriverManager.getConnection(urlcero, login, password);
            Statement stmt = coneccionini.createStatement();
            ResultSet res = stmt.executeQuery("select @@datadir");

            while (res.next()) {
                installMysql = res.getString(1);
            }

            installMysql = installMysql.replaceFirst("data", "bin");
        } catch (Exception ee) {
        }

    }

    private void restaurar() throws IOException {
        obtenerRutaMysql();
        Process p = Runtime.getRuntime().exec(installMysql + "mysql -u " + password + " -p" + login + " -h localhost " + bd);
        final InputStream es = p.getErrorStream();
        Thread hiloError = new Thread() {
            public void run() {
                try {
                    byte[] buffer = new byte[1024];
                    int leido = es.read(buffer);
                    while (leido > 0) {
                        //System.out.println(new String(buffer, 0, leido));
                        leido = es.read(buffer);
                    }
                    es.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        };
        hiloError.start();

        OutputStream os = p.getOutputStream();
        FileInputStream fis = new FileInputStream(nombrebackup.getAbsolutePath());

        byte buffer[] = new byte[1024];
        int leido = fis.read(buffer);
        while (leido > 0) {
            //System.out.println(leido);
            os.write(buffer, 0, leido);
            leido = fis.read(buffer);
        }
        os.close();
        fis.close();
        //System.out.println("termine de cargar el backup");
        Base.open("com.mysql.jdbc.Driver", "jdbc:mysql://localhost/" + DatosGenericos.dataBaseName, DatosGenericos.userDB, DatosGenericos.passwordDB);

    }

    public void CrearBackupSilencioso() {
        obtenerRutaMysql();
        Runtime rt = Runtime.getRuntime();
        try {
            String dir = (new File(System.getProperty("user.dir")).getAbsolutePath());
            String command = installMysql + "mysqldump --opt -u " + login + " -p" + password + " -h localhost " + bd + " -r \"" + dir + "/backupEmail.sql\"";
            //System.out.println(command);
            rt.exec(command);
        } catch (IOException ex) {
            ex.printStackTrace();

        }

    }
}
