/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Viet
 */
public class Customer {
    private String Username;
    private String Password;
    private String CutomerName;
    private String PhoneNumber;

    public Customer(String Username, String Password, String CutomerName, String PhoneNumber) {
        this.Username = Username;
        this.Password = Password;
        this.CutomerName = CutomerName;
        this.PhoneNumber = PhoneNumber;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getCutomerName() {
        return CutomerName;
    }

    public void setCutomerName(String CutomerName) {
        this.CutomerName = CutomerName;
    }

    public String getPhoneNumber() {
        return PhoneNumber;
    }

    public void setPhoneNumber(String PhoneNumber) {
        this.PhoneNumber = PhoneNumber;
    }
    
    
}
