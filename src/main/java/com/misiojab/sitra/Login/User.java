package com.misiojab.sitra.Login;


public class User {

  private long id;
  private String username;
  private String password;
  private String role;
  private String team;
  private String encryptedPassword;

    public User(long aLong, String string, String string1, String string2, String string3) {
    }

  public User() {

  }

  public String getEncryptedPassword(){
      return encryptedPassword;
  }

  public void setEncryptedPassword(String encryptedPassword){
    this.encryptedPassword = encryptedPassword;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getUsername() {
    return username;
  }

  public void setUsername(String username) {
    this.username = username;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getRole() {
    return role;
  }

  public void setRole(String role) {
    this.role = role;
  }


  public String getTeam() {
    return team;
  }

  public void setTeam(String team) {
    this.team = team;
  }

}
