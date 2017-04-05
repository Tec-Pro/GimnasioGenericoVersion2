package BD;

import Controladores.Modulo;
import Modelos.Socio;
import Modelos.User;
import Utiles.DatosGenericos;
    import com.mchange.v2.c3p0.DataSources;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.sql.DataSource;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import org.h2.tools.RunScript;
import org.javalite.activejdbc.Base;
import org.javalite.activejdbc.DB;
import org.javalite.activejdbc.LazyList;

/**
 *
 * @author ING JARC
 */
public class ConexionBD {

    public static final String driver = "org.h2.Driver";
    public static final String urlIfExists = "jdbc:h2:" + getAbsolutePathRunning() + "/database/database_gym;IFEXISTS=TRUE;DATABASE_TO_UPPER=false;CIPHER=AES";
    public static final String url = "jdbc:h2:" + getAbsolutePathRunning() + "/database/database_gym;CIPHER=AES";
    public static final String usr = "t3cpr0";
    public static final String pwd = "db_t3cpr0_encrypted computacion2011";

    static DataSource dataSourcePooled;

    public static File nombrebackup = null;
    public static File rutabackup = null;
    public static int selecGuardaBack = 0;
    public static int selecRestauraBack = 0;

    /**
     * return absolute jar path
     *
     * @return
     */
    public static String getAbsolutePathRunning() {
        return new File(System.getProperty("user.dir")).getAbsolutePath();
    }

    public static void initDB() throws ClassNotFoundException, SQLException {
        Class.forName(driver);
        new ConexionBD().openDataBase();
        Base.close();
        DataSource dataSourceUnpooled = DataSources.unpooledDataSource(urlIfExists, usr, pwd);
        dataSourcePooled = DataSources.pooledDataSource(dataSourceUnpooled); //init the connection pool
        Base.open(dataSourcePooled); //get connection from pool

    }

    public static Connection abrirBase() {
        if (!Base.hasConnection()) {
            Base.open(dataSourcePooled); //get connection from pool
        }
        return Base.connection();
    }

    public void openDataBase() throws SQLException {
        if (!Base.hasConnection()) {
            try {
                Base.open(driver, urlIfExists, usr, pwd);
            } catch (org.javalite.activejdbc.InitException ex) {
                createDataBase();
            }
        }
    }

    private void createDataBase() throws SQLException {
        Base.open(driver, url, usr, pwd);
        if (Base.hasConnection()) {
            InputStreamReader reader = new InputStreamReader(getClass().getResourceAsStream("/sql/database.sql"));
            RunScript.execute(Base.connection(), reader);
            reader = new InputStreamReader(getClass().getResourceAsStream("/sql/generic_data.sql"));
            RunScript.execute(Base.connection(), reader);
        }
    }

    public static void AbrirRutaBackup() {
        JFileChooser chooser = new JFileChooser();
        chooser.setApproveButtonText("Abrir .db");
        chooser.addChoosableFileFilter(new SQLFilter());
        chooser.showOpenDialog(null);
        if (chooser.getSelectedFile() != null) {
            nombrebackup = chooser.getSelectedFile();
            selecRestauraBack = 1;
        } else if (chooser.getSelectedFile() == null) {
            selecRestauraBack = 0;
        }
    }

    public static void RestaurarBackup() throws SQLException, IOException {
        if (selecRestauraBack == 1) {
            Base.close();// really connection goes back to pool
            DB.closeAllConnections();
            DataSources.destroy(dataSourcePooled);//shut down the pool
            Files.copy(nombrebackup.toPath(), new File(getAbsolutePathRunning() + "/database/database_gym.mv.db").toPath(), StandardCopyOption.REPLACE_EXISTING);
            try {
                initDB();
                JOptionPane.showMessageDialog(null, "Se restauró correctamente!");
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (selecRestauraBack == 0) {
            JOptionPane.showMessageDialog(null, "No se seleccionÃ³ ningun archivo de Backup!");
        }
    }

    public static void CrearBackup() {
        if (selecGuardaBack == 1) {
            try {
                Files.copy(new File(getAbsolutePathRunning() + "/database/database_gym.mv.db").toPath(), rutabackup.toPath(), StandardCopyOption.REPLACE_EXISTING);
            } catch (IOException ex) {
                Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (selecGuardaBack == 0) {
            JOptionPane.showMessageDialog(null, "No se creo ningÃºn archivo de backup!");
        }
    }

    public static void GuardarRutaBackup() {
        JFileChooser fc = new JFileChooser();
        fc.setApproveButtonText("Guardar Backup");
        fc.addChoosableFileFilter(new SQLFilter());
        fc.showSaveDialog(null);
        if (fc.getSelectedFile() != null) {
            rutabackup = fc.getSelectedFile();
            selecGuardaBack = 1;
        } else if (fc.getSelectedFile() == null) {
            selecGuardaBack = 0;
        }
    }

    public static class SQLFilter extends javax.swing.filechooser.FileFilter {

        final static String sql = ".db";

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
            return "Archivos .db";
        }
    }

    public static void main(String[] args) throws InterruptedException, Exception {
        new ConexionBD().createDataBase();
    }
}
