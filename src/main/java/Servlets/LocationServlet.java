package Servlets;

import DAOs.LocationDAO;
import Entities.Location;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = "/LocationServlet")
public class LocationServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        System.out.println("Loca Servlet");
        String city = request.getParameter("city");
        String street = request.getParameter("street");

        Location loc= new Location();
        loc.setCity(city);
        loc.setStreet(street);
        LocationDAO dao= new LocationDAO();
        if(dao.saveLocation(loc)){

            RequestDispatcher rq= request.getRequestDispatcher("add-location.jsp");
            rq.forward(request,response);
        }

    }
}
