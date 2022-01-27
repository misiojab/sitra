package com.misiojab.sitra.Login;

import com.misiojab.sitra.MainService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Objects;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {

    private final LoginService loginService = new LoginService(MainService.getInstance());

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        response.getWriter().append("Served at: ").append(request.getContextPath());

        String username = request.getParameter("username");
        String password = Objects.requireNonNullElse(request.getParameter("password"), "");
        String encryptedPassword = SecurityProvider.stringToSHA256(password);

        try {

            User user = LoginService.userLogin(username, encryptedPassword);


            if (user != null) {

                session.setAttribute("authorised", username);
                session.setAttribute("authorised-id", user.getId());
                System.out.println("success");
                System.out.println(session);
                System.out.println(user.getId()+username+password+SecurityProvider.stringToSHA256(password));

                response.sendRedirect(request.getContextPath() + "/");


            } else {
                session.invalidate();
                System.out.println("brak success");
                System.out.println(session);
                System.out.println(user.getId()+username+password+SecurityProvider.stringToSHA256(password));
                response.setStatus(401);
                response.sendRedirect(request.getContextPath() + "/?status=unauthorized");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 /*
        User user = null;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            user = LoginService.userLogin(username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if(user != null) {
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }else {
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
   */

    }


}
