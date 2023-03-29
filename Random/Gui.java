package Random;

import javax.swing.JOptionPane;

// A Basic Graphic use inteface in Java

public class Gui {
    public static void main(String[] args) {

        String name = JOptionPane.showInputDialog("Enter your name sir");
        JOptionPane.showMessageDialog(null, name);

        int age =Integer.parseInt(JOptionPane.showInputDialog("Enter your height"));
        JOptionPane.showMessageDialog(null, age);

        double height = Double.parseDouble(JOptionPane.showInputDialog("Enter your age"));
        JOptionPane.showMessageDialog(null, height); 
    }
}