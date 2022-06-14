package Servlets;

import DAOs.AdminLoginDAO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/Login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (AdminLoginDAO.validate(username, password)) {
            System.out.println("LoginServlet");
            RequestDispatcher dispatcher = request.getRequestDispatcher("dashboard.jsp");
            dispatcher.forward(request, response);
        }else {
            System.out.println("Exception Couldn't validate Login");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
