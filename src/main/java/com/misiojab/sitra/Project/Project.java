package com.misiojab.sitra.Project;


import java.sql.Timestamp;

public class Project {

  private long id;
  private String projectName;
  private String assignedTeam;


  public Project(String projectName, String assignedTeam) {

  }

  public Project() {

  }


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getProjectName() {
    return projectName;
  }

  public void setProjectName(String projectName) {
    this.projectName = projectName;
  }


  public String getAssignedTeam() {
    return assignedTeam;
  }

  public void setAssignedTeam(String assignedTeam) {
    this.assignedTeam = assignedTeam;
  }

}
