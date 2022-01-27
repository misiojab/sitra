package com.misiojab.sitra.Team;

import com.misiojab.sitra.MainService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "TeamServlet", value = "/team")
public class TeamServlet extends HttpServlet {

    private final TeamService teamService = new TeamService(MainService.getInstance());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        String id = request.getParameter("id");
        String name = request.getParameter("Team_name");

        try {
            teamService.CreateTeam(id, name);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}