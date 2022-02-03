package com.misiojab.sitra.Issue;


import com.misiojab.sitra.AppConfig;

import java.sql.*;
import java.util.ArrayList;



public class Issue {



  private long id;
  private String category;
  private String name;
  private String priority;
  private String feature;
  private String status;
  private String assignedTo;
  private String description;
  private java.sql.Timestamp openedTime;
  private java.sql.Timestamp lastUpdate;
  private String projectName;
  private long sprintId;
  private Timestamp dueDate;
  private Timestamp startDate;


  public Issue() {
  }

  public Timestamp getDueDate (){
    return openedTime;
  }

  public void setDueDate (Timestamp dueDate){
    this.dueDate = dueDate;
  }

  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }

  public void setStartDate (Timestamp startDate){
    this.startDate = startDate;
  }

  public Timestamp getStartDate() {
    return startDate;
  }

  public String getCategory() {
    return category;
  }

  public void setCategory(String category) {
    this.category = category;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getPriority() {
    return priority;
  }

  public void setPriority(String priority) {
    this.priority = priority;
  }


  public String getFeature() {
    return feature;
  }

  public void setFeature(String feature) {
    this.feature = feature;
  }


  public String getStatus() {
    return status;
  }

  public void setStatus(String status) {
    this.status = status;
  }


  public String getAssignedTo() {
    return assignedTo;
  }

  public void setAssignedTo(String assignedTo) {
    this.assignedTo = assignedTo;
  }


  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }


  public java.sql.Timestamp getOpenedTime() {
    return openedTime;
  }

  public void setOpenedTime(java.sql.Timestamp openedTime) {
    this.openedTime = openedTime;
  }


  public java.sql.Timestamp getLastUpdate() {
    return lastUpdate;
  }

  public void setLastUpdate(java.sql.Timestamp lastUpdate) {
    this.lastUpdate = lastUpdate;
  }


  public String getProjectName() {
    return projectName;
  }

  public void setProjectName(String projectName) {
    this.projectName = projectName;
  }


  public long getSprintId() {
    return sprintId;
  }

  public void setSprintId(long sprintId) {
    this.sprintId = sprintId;
  }

}
