package puntodeventapapeleria;

import java.sql.*;
import javax.swing.JOptionPane;

/**
 *
 * @author david
 */
public class Conectar1 {

    Connection conectar = null;
    //PARA PRUEBAS

    public Connection conexion() {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");//.newInstance();
            conectar = DriverManager.getConnection("jdbc:mysql://localhost/conexion", "carlos", "1998");

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error de conexion de la base de datos");
        } catch (ClassNotFoundException ex) {
        }
        return conectar;
    }

// YA EN EJECUCION
    public Connection conexion(String usuario, String password) {
        try {
            Class.forName("org.gjt.mm.mysql.Driver");//.newInstance();
            conectar = DriverManager.getConnection("jdbc:mysql://localhost/conexion", usuario, password);

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(null, "Error de conexion de la base de datos");
        } catch (ClassNotFoundException ex) {
        }
        return conectar;
    }
}
